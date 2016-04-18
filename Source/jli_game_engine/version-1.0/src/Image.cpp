//
//  Image.cpp
//  JLIGameEngineTest
//
//  Created by James Folk on 1/8/15.
//  Copyright (c) 2015 James Folk. All rights reserved.
//

#include "Image.h"
#include "JLIFactoryTypes.h"
#include "World.h"
#include "ImageBuilder.h"
#include "stb_image.h"

#include "WorldResourceLoader.h"

#include "Log.h"
#define TAG "Image.cpp"
#define FORMATSTRING "{\"njli::Image\":[]}"
#include "btPrint.h"


namespace njli
{
    Image::Image():
    AbstractFactoryObject(this),
    m_RawData(NULL),
    m_Width(0),
    m_Height(0),
    m_Componenents(0),
    m_IsInWorldResourceLoader(false),
    m_Filename(""),
    m_hasAlpha(false),
    m_isCompressed(false),
    m_pvrDataSize(0)
    {
//        generate(2, 2, 4);
    }
    
    Image::Image(const AbstractBuilder &builder):
    AbstractFactoryObject(this),
    m_RawData(NULL),
    m_Width(0),
    m_Height(0),
    m_Componenents(0),
    m_IsInWorldResourceLoader(false),
    m_Filename(""),
    m_hasAlpha(false),
    m_isCompressed(false),
    m_pvrDataSize(0)
    {
    }
    
    Image::Image(const Image &copy):
    AbstractFactoryObject(this),
    m_RawData(NULL),
    m_Width(copy.getWidth()),
    m_Height(copy.getHeight()),
    m_Componenents(copy.getNumberOfComponents()),
    m_IsInWorldResourceLoader(false),
    m_Filename(copy.getFilename()),
    m_hasAlpha(copy.m_hasAlpha),
    m_isCompressed(copy.m_isCompressed),
    m_pvrDataSize(copy.m_pvrDataSize)
    {
        if(copy.isPvr())
        {
            m_RawData = new u8[m_pvrDataSize];
            
            memcpy( m_RawData,copy.m_RawData, m_pvrDataSize );
        }
        else
        {
            u32 size = copy.getWidth()  *
            copy.getHeight() *
            copy.getNumberOfComponents();
            
            DEBUG_ASSERT(size > 0);
            
            m_RawData = new u8[size];
            
            memcpy( m_RawData,copy.m_RawData, size );
        }
        
    }
    
    Image::~Image()
    {
        if(m_RawData)
            delete [] m_RawData;
        m_RawData=NULL;
        
        if(isInWorldResourceLoader())
        {
            njli::World::getInstance()->getWorldResourceLoader()->remove(getFilename());
        }
    }
    
    Image &Image::operator=(const Image &rhs)
    {
        if(this != &rhs)
        {
            m_Width = rhs.getWidth();
            m_Height = rhs.getHeight();
            m_Componenents = rhs.getNumberOfComponents();
            m_IsInWorldResourceLoader = false;
            m_Filename = rhs.getFilename();
            m_hasAlpha = rhs.m_hasAlpha;
            m_isCompressed = rhs.m_isCompressed;
            m_pvrDataSize = rhs.m_pvrDataSize;
            
            if(m_RawData)
                delete [] m_RawData;
            
            if(rhs.isPvr())
            {
                if(m_pvrDataSize > 0)
                {
                    m_RawData = new u8[m_pvrDataSize];
                    
                    memcpy( m_RawData, rhs.m_RawData, m_pvrDataSize );
                }
            }
            else
            {
                u32 size = getWidth()  *
                getHeight() *
                getNumberOfComponents();
                
                DEBUG_ASSERT(size > 0);
                
                m_RawData = new u8[size];
                
                memcpy( m_RawData, rhs.m_RawData, size );
            }
            
        }
        return *this;
    }
    
    s32	Image::calculateSerializeBufferSize() const
    {
        //TODO: calculateSerializeBufferSize
        return 0;
    }
    
    void Image::serialize(void* dataBuffer, btSerializer* serializer) const
    {
        //TODO: serialize
    }
    
    const char *Image::getClassName()const
    {
        return "Image";
    }
    
    s32 Image::getType()const
    {
        return Image::type();
    }
    
    Image::operator std::string() const
    {
        return njli::JsonJLI::parse(string_format("%s", FORMATSTRING).c_str());
    }
    
    Image **Image::createArray(const u32 size)
    {
        return (Image**)World::getInstance()->getWorldFactory()->createArray(Image::type(), size);
    }
    
    void Image::destroyArray(Image **array, const u32 size)
    {
        World::getInstance()->getWorldFactory()->destroyArray((AbstractFactoryObject**)array, size);
    }
    
    Image *Image::create()
    {
        return dynamic_cast<Image*>(World::getInstance()->getWorldFactory()->create(Image::type()));
    }
    
    Image *Image::create(const ImageBuilder &builder)
    {
        AbstractBuilder *b = (AbstractBuilder *)&builder;
        
        return dynamic_cast<Image*>(World::getInstance()->getWorldFactory()->create(*b));
    }
    
    Image *Image::clone(const Image &object)
    {
        return dynamic_cast<Image*>(World::getInstance()->getWorldFactory()->clone(object, false));
    }
    
    Image *Image::copy(const Image &object)
    {
        return dynamic_cast<Image*>(World::getInstance()->getWorldFactory()->clone(object, true));
    }
    
    void Image::destroy(Image *object)
    {
        World::getInstance()->getWorldFactory()->destroy(object);
    }
    
    void Image::load(Image &object, lua_State *L, int index)
    {
        // Push another reference to the table on top of the stack (so we know
        // where it is, and this function can work for negative, positive and
        // pseudo indices
        lua_pushvalue(L, index);
        // stack now contains: -1 => table
        lua_pushnil(L);
        // stack now contains: -1 => nil; -2 => table
        while (lua_next(L, -2))
        {
            // stack now contains: -1 => value; -2 => key; -3 => table
            // copy the key so that lua_tostring does not modify the original
            lua_pushvalue(L, -2);
            // stack now contains: -1 => key; -2 => value; -3 => key; -4 => table
            const char *key = lua_tostring(L, -1);
            const char *value = lua_tostring(L, -2);
            if(lua_istable(L, -2))
            {
                Image::load(object, L, -2);
            }
            else
            {
                if(lua_isnumber(L, index))
                {
                    double number = lua_tonumber(L, index);
                    printf("%s => %f\n", key, number);
                }
                else if(lua_isstring(L, index))
                {
                    const char *v = lua_tostring(L, index);
                    printf("%s => %s\n", key, v);
                }
                else if(lua_isboolean(L, index))
                {
                    bool v = lua_toboolean(L, index);
                    printf("%s => %d\n", key, v);
                }
                else if(lua_isuserdata(L, index))
                {
//                    swig_lua_userdata *usr;
//                    swig_type_info *type;
//                    assert(lua_isuserdata(L,index));
//                    usr=(swig_lua_userdata*)lua_touserdata(L,index);  /* get data */
//                    type = usr->type;
//                    njli::AbstractFactoryObject *object = static_cast<njli::AbstractFactoryObject*>(usr->ptr);
//                    printf("%s => %d:%s\n", key, object->getType(), object->getClassName());
                    
                }
            }
            // pop value + copy of key, leaving original key
            lua_pop(L, 2);
            // stack now contains: -1 => key; -2 => table
        }
        // stack now contains: -1 => table (when lua_next returns 0 it pops the key
        // but does not push anything.)
        // Pop table
        lua_pop(L, 1);
        // Stack is now the same as it was on entry to this function
    }
    
    u32 Image::type()
    {
        return JLI_OBJECT_TYPE_Image;
    }
    
    Image *Image::createSubImage(const Image &imageSource,
                                        const btVector2 &position,
                                        const btVector2 &dimensions)
    {
        Image *img = Image::create();
        img->generate(dimensions.x(), dimensions.y(), imageSource.getNumberOfComponents());
        img->setPixels(position, dimensions, imageSource);
        return img;
    }
    
    bool Image::setPixel(const btVector2 &position, const btVector4 &color)
    {
        if((m_RawData) &&
           (position.x() < getWidth()) &&
           (position.y() < getHeight()))
        {
            s32 x_indice = position.x() * getNumberOfComponents();
            s32 y_indice = position.y() * getNumberOfComponents() * getWidth();
            
            switch (getNumberOfComponents())
            {
                case 4:
                    m_RawData[x_indice + y_indice + 3] = (color.w() * 255.0f);
                case 3:
                    m_RawData[x_indice + y_indice + 2] = (color.z() * 255.0f);
                case 2:
                    m_RawData[x_indice + y_indice + 1] = (color.y() * 255.0f);
                case 1:
                    m_RawData[x_indice + y_indice + 0] = (color.x() * 255.0f);
            }
            return true;
        }
        return false;
    }
    
    bool Image::setPixel(const btVector2 &position, const Image &imageSource)
    {
        btVector4 pixel;
        imageSource.getPixel(position, pixel);
        return setPixel(position, pixel);
    }
    
    bool Image::getPixel(const btVector2 &position, btVector4 &pixel)const
    {
        if((m_RawData) &&
           (position.x() < getWidth()) &&
           (position.y() < getHeight()))
        {
            s32 x_indice = position.x() * getNumberOfComponents();
            s32 y_indice = position.y() * getNumberOfComponents() * getWidth();
            f32 red = 0.0f;
            f32 green = 0.0f;
            f32 blue = 0.0f;
            f32 alpha = 0.0f;
            
            switch (getNumberOfComponents())
            {
                case 4:
                    alpha = m_RawData[x_indice + y_indice + 3] / 255.0f;
                case 3:
                    blue = m_RawData[x_indice + y_indice + 2] / 255.0f;
                case 2:
                    green = m_RawData[x_indice + y_indice + 1] / 255.0f;
                case 1:
                    red = m_RawData[x_indice + y_indice + 0] / 255.0f;
            }
            
            pixel = btVector4(red, green, blue, alpha);
            return true;
        }
        return false;
    }
    
    bool Image::setPixels(const btVector2 &destinationPosition,
                          const btVector2 &destinationDimensions,
                          const btVector4 &color)
    {
        if(m_RawData)
        {
            u8 *fillRow = createFillRow(0, getWidth(), color);
            DEBUG_ASSERT(fillRow);

            u32 width = destinationDimensions.x();
            u32 height = destinationDimensions.y();
            u32 xOffset = destinationPosition.x();
            u32 yOffset = destinationPosition.y();
            
            if(xOffset > getWidth())
                return false;
            if(yOffset > getHeight())
                return false;

            if((xOffset + width) > getWidth())
                width = getWidth() - xOffset;
            else if(width < 0)
                return false;

            if((yOffset + height) > getHeight())
                height = getHeight() - yOffset;
            else if(height < 0)
                return false;
            
            for (u32 y = yOffset; y < (yOffset + height); ++y)
            {
                setPixelRow(fillRow, y, width, xOffset);
            }

            delete [] fillRow;fillRow=NULL;
            
            return true;
        }
        
        return false;
    }
    
    bool Image::setPixels(const btVector2 &position,
                          const btVector2 &dimension,
                          const Image &imageSource,
                          const btVector2 &sourcePosition)
    {
        btVector4 pixel;
        
        bool error = false;
        
        btVector2 fromPos, toPos;
        for (u32 x = 0; x < dimension.x(); ++x)
        {
            for(u32 y = 0; y < dimension.y(); ++y)
            {
                fromPos = btVector2(x, y) + position;
                toPos = btVector2(x, y) + sourcePosition;
                
                if(imageSource.getPixel(fromPos, pixel))
                {
                    if(!setPixel(toPos, pixel))
                    {
                        DEBUG_LOG_PRINT_E(TAG, "error writing (%d, %d)", x, y);
                        error = true;
                    }
                }
                else
                {
                    DEBUG_LOG_PRINT_E(TAG, "error reading (%d, %d)", x, y);
                    error = true;
                }
            }
        }
        
        return error;
    }
    
    bool Image::getPixels(const btVector2 &position,
                          const btVector2 &dimensions,
                          Image &image,
                          const btVector2 &sourcePosition)const
    {
        return image.setPixels(position, dimensions, image, sourcePosition);
    }
    
    u8 Image::getNumberOfComponents()const
    {
        return m_Componenents;
    }
    
    u32 Image::getWidth()const
    {
        return m_Width;
    }
    
    u32 Image::getHeight()const
    {
        return m_Height;
    }
    
    const char *Image::getFilename()const
    {
        return m_Filename.c_str();
    }
    
    u8 Image::getBytesPerPixel()const
    {
        return sizeof(u8) * getNumberOfComponents();
    }
    
    const u8* Image::getDataRaw() const
    {
        return m_RawData;
    }
    
    bool Image::isPvr()const
    {
        return m_pvrDataSize != 0;
    }
    
    bool Image::isCompressed()const
    {
        return m_isCompressed;
    }
    
    u8* Image::getDataRaw()
    {
        return m_RawData;
    }
    
    static s32 isPowerOfTwo(s32 v)
    {
        return v && !(v & (v - 1));
    }
    
    static s32 fixPowerOfTwo(s32 v)
    {
        v--;
        v |= v >> 1;
        v |= v >> 2;
        v |= v >> 4;
        v |= v >> 8;
        v |= v >> 16;
        v++;
        
        return v;
    }
    
    void Image::setDataRaw(u32 width, u32 height, u8 numberOfComponents, const u8 *const data, const btVector4 &fillColor)
    {
        DEBUG_ASSERT(data);
        DEBUG_ASSERT(numberOfComponents > 0 && numberOfComponents < 5);
        
        m_pvrDataSize = 0;
        m_isCompressed = false;
        
        if(m_RawData)
            delete [] m_RawData;
        m_RawData = NULL;
        
        m_Componenents = numberOfComponents;
        
        m_Width = (isPowerOfTwo(width))?width:fixPowerOfTwo(width);
        m_Height = (isPowerOfTwo(height))?height:fixPowerOfTwo(height);
        
        m_RawData = new u8[getNumberOfComponents() * getWidth() * getHeight()];
        DEBUG_ASSERT(m_RawData);
        
        u8 *fillRow = createFillRow(0, getWidth(), fillColor);
        
        
        //offset the original image onto the canvas?
        s32 x = 0;
        s32 y = 0;
        
        s32 x_indice = x;
        s32 y_indice = y * width;
        
        s32 fromIncrement = 0;
        s32 toIncrement = 0;
        
        for (u32 y_current = 0; y_current < getHeight(); y_current++)
        {
            fromIncrement = x_indice + (y_current * width);
            fromIncrement *= getNumberOfComponents();
            
            toIncrement = (y_indice + y_current) * getWidth();
            toIncrement *= getNumberOfComponents();
            
            setPixelRow(fillRow, y_current, getWidth());
            
            if(y_current < height)
                memcpy(m_RawData + toIncrement, data + fromIncrement, getNumberOfComponents() * width);
        }
        
        delete [] fillRow;fillRow=NULL;
        
        char buffer[BUFFER_SIZE];
        sprintf(buffer, "Set Width:%d, Height:%d, Components:%d", width, height, numberOfComponents);
        
        m_Filename = buffer;
        
        DEBUG_ASSERT(m_RawData);

    }
    
    void Image::generate(u32 width, u32 height, u8 numberOfComponents, const btVector4 &fillColor)
    {
        DEBUG_ASSERT(numberOfComponents > 0 && numberOfComponents < 5);
        
        if(m_RawData)
            delete [] m_RawData;
        m_RawData = NULL;
        
        m_Componenents = numberOfComponents;
        m_Width = width;
        m_Height = height;
        
        m_RawData = new u8[getNumberOfComponents() * getWidth() * getHeight()];
        DEBUG_ASSERT(m_RawData);
        
        u8 *fillRow = createFillRow(0, getWidth(), fillColor);
        
        for (u32 y_current = 0; y_current < getHeight(); y_current++)
        {
            setPixelRow(fillRow, y_current, getWidth());
        }
        
        delete [] fillRow;fillRow=NULL;
        
        char buffer[BUFFER_SIZE];
        sprintf(buffer, "Generated Width:%d, Height:%d, Components:%d", width, height, numberOfComponents);
        m_Filename = buffer;
    }
    
    u64 Image::getDataRawLength()const
    {
        return getNumberOfComponents() * getWidth() * getHeight();
    }
    
    void Image::setDataRawFromWorldResourceLoader(u8 *data, u32 x, u32 y, u8 numberOfComponents, const char * filename)
    {
        m_IsInWorldResourceLoader = true;
        setDataRaw(x, y, numberOfComponents, data);
        m_Filename = filename;
    }
    
    bool Image::isInWorldResourceLoader()const
    {
        return m_IsInWorldResourceLoader;
    }
    
    void Image::setPixelRow(u8 *data, u32 row, u32 width, u32 xOffset)
    {
        DEBUG_ASSERT(data);
        DEBUG_ASSERT(m_RawData);
        DEBUG_ASSERT((xOffset + width) <= getWidth());
        
        s32 toIncrement = xOffset + (row * getWidth());
        toIncrement *= getNumberOfComponents();
        memcpy(m_RawData + toIncrement, data, getNumberOfComponents() * width);
    }
    
    void Image::getPixelRow(u8 *data, u32 row, u32 width)
    {
        DEBUG_ASSERT(data);
        DEBUG_ASSERT(m_RawData);
        
        s32 x_indice = 0;
        
        s32 fromIncrement = x_indice + (row * getWidth());
        fromIncrement *= getNumberOfComponents();
        
        memcpy(data, m_RawData + fromIncrement, getNumberOfComponents() * width);
    }
    
//    u8 *Image::createFillRow(u8 components, u32 width, const btVector4 &fillColor)
    u8 *Image::createFillRow(s32 xOffset, s32 fillWidth, const btVector4 &fillColor)
    {
        if((xOffset + fillWidth) > getWidth())
            fillWidth = getWidth() - xOffset;
        else if(fillWidth < 0)
            fillWidth = 0;
        
        u8 *fillRow = new u8[getNumberOfComponents() * getWidth()];
        
        for (s32 xx = xOffset; xx < fillWidth; ++xx)
        {
            s32 x_indice = xx * getNumberOfComponents();
            s32 y_indice = 0 * getNumberOfComponents() * getWidth();
            
            switch (getNumberOfComponents())
            {
                case 4:
                    fillRow[x_indice + y_indice + 3] = (fillColor.w() * 255.0f);
                case 3:
                    fillRow[x_indice + y_indice + 2] = (fillColor.z() * 255.0f);
                case 2:
                    fillRow[x_indice + y_indice + 1] = (fillColor.y() * 255.0f);
                case 1:
                    fillRow[x_indice + y_indice + 0] = (fillColor.x() * 255.0f);
            }
        }
        return fillRow;
    }
    
    void Image::drawLine(const btVector2 &from, const btVector2 &to, const btVector4 &color)
    {
        //http://tech-algorithm.com/articles/drawing-line-using-bresenham-algorithm/
        
        s32 x = from.x();
        s32 y = from.y();
        s32 x2 = to.x();
        s32 y2 = to.y();
        
        
        s32 w = x2 - x ;
        s32 h = y2 - y ;
        s32 dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0 ;
        if (w<0) dx1 = -1 ; else if (w>0) dx1 = 1 ;
        if (h<0) dy1 = -1 ; else if (h>0) dy1 = 1 ;
        if (w<0) dx2 = -1 ; else if (w>0) dx2 = 1 ;
        s32 longest = std::abs(w) ;
        s32 shortest = std::abs(h) ;
        
        if (!(longest>shortest))
        {
            longest = std::abs(h) ;
            shortest = std::abs(w) ;
            if (h<0) dy2 = -1 ; else if (h>0) dy2 = 1 ;
            dx2 = 0 ;
        }
        s32 numerator = longest >> 1 ;
        
        for (s32 i=0;i<=longest;i++)
        {
            setPixel(btVector2(x, y), color);
            numerator += shortest ;
            if (!(numerator<longest))
            {
                numerator -= longest ;
                x += dx1 ;
                y += dy1 ;
            }
            else
            {
                x += dx2 ;
                y += dy2 ;
            }
        }
    }
    
    void Image::drawLine(const btVector2 &from, const btVector2 &to, const Image &imageSource)
    {
        btVector4 pixel;
        
        //http://tech-algorithm.com/articles/drawing-line-using-bresenham-algorithm/
        
        s32 x = from.x();
        s32 y = from.y();
        s32 x2 = to.x();
        s32 y2 = to.y();
        
        
        s32 w = x2 - x ;
        s32 h = y2 - y ;
        s32 dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0 ;
        if (w<0) dx1 = -1 ; else if (w>0) dx1 = 1 ;
        if (h<0) dy1 = -1 ; else if (h>0) dy1 = 1 ;
        if (w<0) dx2 = -1 ; else if (w>0) dx2 = 1 ;
        s32 longest = std::abs(w) ;
        s32 shortest = std::abs(h) ;
        
        if (!(longest>shortest))
        {
            longest = std::abs(h) ;
            shortest = std::abs(w) ;
            if (h<0) dy2 = -1 ; else if (h>0) dy2 = 1 ;
            dx2 = 0 ;
        }
        s32 numerator = longest >> 1 ;
        
        for (s32 i=0;i<=longest;i++)
        {
            if(imageSource.getPixel(btVector2(x, y), pixel))
            {
                if (!setPixel(btVector2(x, y), pixel))
                {
                    DEBUG_LOG_PRINT_E(TAG, "error reading (%d, %d)", x, y);
                }
            }
            else
            {
                DEBUG_LOG_PRINT_E(TAG, "error writing (%d, %d)", x, y);
            }
            
            
            numerator += shortest ;
            if (!(numerator<longest))
            {
                numerator -= longest ;
                x += dx1 ;
                y += dy1 ;
            }
            else
            {
                x += dx2 ;
                y += dy2 ;
            }
        }
    }
    
    void Image::blur()
    {
        u32 x = 1,
        y,
        width  = getWidth()  - 1,
        height  = getHeight() - 1,
        bw = getWidth() * getNumberOfComponents();
        
        if( getNumberOfComponents() < 3 )
        { return; }
        
        while( x != height )
        {
            y = 1;
            while( y < width )
            {
                u32 jb   =   y   * getNumberOfComponents(),
                jp   = ( y + 1 ) * getNumberOfComponents(),
                jm   = ( y - 1 ) * getNumberOfComponents(),
                ib   =   x       * bw,
                im   = ( x - 1 ) * bw,
                ip   = ( x + 1 ) * bw,
                ibjb = ib + jb;
                
                u8 *px1 = &m_RawData[ ib + jb ],
                *px2 = &m_RawData[ ib + jm ],
                *px3 = &m_RawData[ ib + jp ],
                *px4 = &m_RawData[ im + jb ],
                *px5 = &m_RawData[ ip + jb ],
                *px6 = &m_RawData[ im + jm ],
                *px7 = &m_RawData[ im + jp ],
                *px8 = &m_RawData[ ip + jm ],
                *px9 = &m_RawData[ ip + jp ];
                
                m_RawData[ ibjb     ] = ( ( px1[ 0 ] << 2 ) +
                                               ( ( px2[ 0 ] + px3[ 0 ] + px4[ 0 ] + px5[ 0 ] ) << 1 ) +
                                               px6[ 0 ] + px7[ 0 ] + px8[ 0 ] + px9[ 0 ] ) >> 4;
                
                m_RawData[ ibjb + 1 ] = ( ( px1[ 1 ] << 2 ) +
                                               ( ( px2[ 1 ] + px3[ 1 ] + px4[ 1 ] + px5[ 1 ] ) << 1 ) +
                                               px6[ 1 ] + px7[ 1 ] + px8[ 1 ] + px9[ 1 ] ) >> 4;
                
                m_RawData[ ibjb + 2 ] = ( ( px1[ 2 ] << 2 ) +
                                               ( ( px2[ 2 ] + px3[ 2 ] + px4[ 2 ] + px5[ 2 ] ) << 1 ) +
                                               px6[ 2 ] + px7[ 2 ] + px8[ 2 ] + px9[ 2 ] ) >> 4;
                ++y;
            }
            
            ++x;
        }
    }
    
    bool Image::setAlpha(const Image &image)
    {
        if(((getNumberOfComponents() == 3) || (getNumberOfComponents() == 4)) &&
           ((image.getNumberOfComponents() == 1) || (image.getNumberOfComponents() == 4)) &&
           getWidth()  == image.getWidth() &&
           getHeight() == image.getWidth() )
        {
            u32 i = 0,
            rgb = 0,
            a   = 0,
            size;
            
            u8 prevComponents = getNumberOfComponents();
            
            u8 *tex;
            
            m_Componenents = 4;
            size = getWidth() * getHeight() * getNumberOfComponents();
            
            tex = new u8[size];
            
            while( i != size )
            {
                tex[ i     ] = m_RawData[ rgb + 2 ];
                tex[ i + 1 ] = m_RawData[ rgb + 1 ];
                tex[ i + 2 ] = m_RawData[ rgb ];
                
                if(image.getNumberOfComponents() == 1)
                    tex[ i + 3 ] = image.m_RawData[a];
                if(image.getNumberOfComponents() == 4)
                    tex[ i + 3 ] = image.m_RawData[i + 3];
                
                ++a;
                rgb += prevComponents;
                i   += getNumberOfComponents();
            }
            
            delete [] m_RawData;m_RawData=NULL;
            
            m_RawData = tex;
            
            return true;
        }
        return false;
    }
    
    bool Image::setAlpha(f32 alpha)
    {
        if(((getNumberOfComponents() == 3) ||
            (getNumberOfComponents() == 4)))
        {
            u32 i = 0, rgb = 0, a = 0, size;
            u8 prevComponents = getNumberOfComponents();
            u8 *tex = NULL;
            
            m_Componenents = 4;
            size = getWidth() * getHeight() * getNumberOfComponents();
            
            tex = new u8[size];
            
            while( i != size )
            {
                tex[ i     ] = m_RawData[ rgb + 2 ];
                tex[ i + 1 ] = m_RawData[ rgb + 1 ];
                tex[ i + 2 ] = m_RawData[ rgb ];
                tex[ i + 3 ] = alpha;
                
                ++a;
                rgb += prevComponents;
                i += getNumberOfComponents();
            }
            
            delete [] m_RawData;m_RawData=NULL;
            
            m_RawData = tex;
            
            return true;
        }
        return false;
    }
    
    bool Image::hasAlpha()const
    {
        return m_hasAlpha;
    }
    
    
    void Image::preMultiplyAlpha()
    {
        btVector4 color;
        f32 r, g, b, a;
        
        if(getNumberOfComponents() == 4)
        {
            for (u32 x = 0; x < getWidth(); ++x)
            {
                for (u32 y = 0; y < getHeight(); ++y)
                {
                    if(getPixel(btVector2(x, y), color))
                    {
                        r = color.x();
                        g = color.y();
                        b = color.z();
                        a = color.w();
                        
                        setPixel(btVector2(x, y), btVector4(r*a, g*a, b*a, a));
                    }
                }
            }
        }
    }
    
    void Image::flip()
    {
        u32 i    = 0,
        size = getWidth()  *
        getHeight() *
        getNumberOfComponents(),
        
        rows = getWidth() * getNumberOfComponents();
        
        u8 *buf = new u8[size];
        
        while( i != getHeight() )
        {
            memcpy( buf + ( i * rows ),
                   m_RawData + ( ( ( getHeight() - i ) - 1 ) * rows ),
                   rows );
            ++i;
        }
        
        memcpy( &m_RawData[ 0 ],
               &buf[ 0 ], size );
        
        delete [] buf;buf=NULL;
    }
    
    
//    static const void PVRTGetOGLES2TextureFormat(const PVRTextureHeaderV3& sTextureHeader, PVRTuint32& internalformat, PVRTuint32& format, PVRTuint32& type)
    static u8 GetNumberOfComponents(const PVRTextureHeaderV3& sTextureHeader)
    {
        PVRTuint64 PixelFormat = sTextureHeader.u64PixelFormat;
        EPVRTVariableType ChannelType = (EPVRTVariableType)sTextureHeader.u32ChannelType;
        EPVRTColourSpace ColourSpace = (EPVRTColourSpace)sTextureHeader.u32ColourSpace;
        
        //Initialisation. Any invalid formats will return 0 always.
//        format = 0;
//        type = 0;
//        internalformat=0;
        
        //Get the last 32 bits of the pixel format.
        PVRTuint64 PixelFormatPartHigh = PixelFormat&PVRTEX_PFHIGHMASK;
        
        //Check for a compressed format (The first 8 bytes will be 0, so the whole thing will be equal to the last 32 bits).
        if (PixelFormatPartHigh==0)
        {
            //Format and type == 0 for compressed textures.
            switch (PixelFormat)
            {
                case ePVRTPF_PVRTCI_2bpp_RGB:
                {
                    return 3;
                }
                case ePVRTPF_PVRTCI_2bpp_RGBA:
                {
                    return 4;
                }
                case ePVRTPF_PVRTCI_4bpp_RGB:
                {
                    return 3;
                }
                case ePVRTPF_PVRTCI_4bpp_RGBA:
                {
                    return 4;
                }
//#ifndef TARGET_OS_IPHONE
//                case ePVRTPF_PVRTCII_2bpp:
//                {
//                    if (ColourSpace == ePVRTCSpacesRGB)
//                    {
//                        internalformat=GL_COMPRESSED_SRGB_ALPHA_PVRTC_2BPPV2_IMG;
//                    }
//                    else
//                    {
//                        internalformat=GL_COMPRESSED_RGBA_PVRTC_2BPPV2_IMG;
//                    }
//                    return;
//                }
//                case ePVRTPF_PVRTCII_4bpp:
//                {
//                    if (ColourSpace == ePVRTCSpacesRGB)
//                    {
//                        internalformat=GL_COMPRESSED_SRGB_ALPHA_PVRTC_4BPPV2_IMG;
//                    }
//                    else
//                    {
//                        internalformat=GL_COMPRESSED_RGBA_PVRTC_4BPPV2_IMG;
//                    }
//                    return;
//                }
//                case ePVRTPF_ETC1:
//                {
//                    internalformat=GL_ETC1_RGB8_OES;
//                    return;
//                }
//#endif
                default:
                    return 4;
            }
        }
        else
        {
            switch (ChannelType)
            {
                case ePVRTVarTypeFloat:
                {
                    switch (PixelFormat)
                    {
                            //HALF_FLOAT_OES
                        case PVRTGENPIXELID4('r','g','b','a',16,16,16,16):
                        {
                            return 4;
                        }
                        case PVRTGENPIXELID3('r','g','b',16,16,16):
                        {
                            return 3;
                        }
                        case PVRTGENPIXELID2('l','a',16,16):
                        {
                            return 1;
                        }
                        case PVRTGENPIXELID1('l',16):
                        {
                            return 1;
                        }
                        case PVRTGENPIXELID1('a',16):
                        {
                            return 1;
                        }
                            //FLOAT (OES)
                        case PVRTGENPIXELID4('r','g','b','a',32,32,32,32):
                        {
                            return 4;
                        }
                        case PVRTGENPIXELID3('r','g','b',32,32,32):
                        {
                            return 3;
                        }
                        case PVRTGENPIXELID2('l','a',32,32):
                        {
                            return 1;
                        }
                        case PVRTGENPIXELID1('l',32):
                        {
                            return 1;
                        }
                        case PVRTGENPIXELID1('a',32):
                        {
                            return 1;
                        }
                    }
                    break;
                }
                case ePVRTVarTypeUnsignedByteNorm:
                {
                    switch (PixelFormat)
                    {
                        case PVRTGENPIXELID4('r','g','b','a',8,8,8,8):
                        {
                            return 4;
                        }
                        case PVRTGENPIXELID3('r','g','b',8,8,8):
                        {
                            return 3;
                        }
                        case PVRTGENPIXELID2('l','a',8,8):
                        {
                            return 1;
                        }
                        case PVRTGENPIXELID1('l',8):
                        {
                            return 1;
                        }
                        case PVRTGENPIXELID1('a',8):
                        {
                            return 1;
                        }
                        case PVRTGENPIXELID4('b','g','r','a',8,8,8,8):
                        {
                            return 4;
                        }
                    }
                    break;
                }
                case ePVRTVarTypeUnsignedShortNorm:
                {
                    switch (PixelFormat)
                    {
                        case PVRTGENPIXELID4('r','g','b','a',4,4,4,4):
                        {
                            return 4;
                        }
                        case PVRTGENPIXELID4('r','g','b','a',5,5,5,1):
                        {
                            return 4;
                        }
                        case PVRTGENPIXELID3('r','g','b',5,6,5):
                        {
                            return 3;
                        }
                    }
                    break;
                }
                default:
                    return 4;
            }
        }
        return 4;
    }
    
    void Image::setPVRData(u8 *pvrData, unsigned long dataSize, const char *fileName)
    {
        DEBUG_ASSERT(pvrData);
        PVRTextureHeaderV3 *header = (PVRTextureHeaderV3*)pvrData;
        
        m_pvrDataSize = dataSize;
        
        PVRTuint64 PixelFormat = header->u64PixelFormat;
        
        //Get the last 32 bits of the pixel format.
        PVRTuint64 PixelFormatPartHigh = PixelFormat&PVRTEX_PFHIGHMASK;
        
        //Check for a compressed format (The first 8 bytes will be 0, so the whole thing will be equal to the last 32 bits).
        m_isCompressed = (PixelFormatPartHigh==0);
        
        m_Width = header->u32Width;
        m_Height = header->u32Height;
        m_Componenents = GetNumberOfComponents(*header);
        
        if(m_RawData)
            delete [] m_RawData;
        
        m_RawData = new u8[m_pvrDataSize];
        
        memcpy( &m_RawData[ 0 ],
               &pvrData[ 0 ], m_pvrDataSize );
        
        
        m_Filename = fileName;
    }
//
//    u8 *Image::getCompressedData()const
//    {
//        return m_RawData;
//    }
    
    u32 Image::getClosestValidGLDim(const u32 dim)const
    {
        for(s32 shift = 0; shift < 12; shift++)
        {
            if((1 << shift) > dim)
                return 1 << (shift);
        }
        return 1 << 11;
    }
}