//
//  WorldResourceLoader.h
//  JLIGameEngineTest
//
//  Created by James Folk on 11/21/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//

#ifndef __JLIGameEngineTest__WorldResourceLoader__
#define __JLIGameEngineTest__WorldResourceLoader__

#include "AbstractObject.h"
#include "JLIFactoryTypes.h"
#include "btHashMap.h"
#include <vector>

class File;

namespace njli {
struct FileData {
public:
    FileData(const void* buffer, s32 size)
    {
        m_buffer = malloc(size);
        m_fileSize = size;
        memcpy(m_buffer, buffer, size);
    }
    ~FileData()
    {
        free(m_buffer);
    }
    const void* getBuffer()
    {
        return m_buffer;
    }
    s32 getSize()
    {
        return m_fileSize;
    }

private:
    void* m_buffer;
    s32 m_fileSize;
};

class Light;
class Image;
class Geometry;
class ShaderProgram;
class Font;
class Lua;
class Xml;
class JsonJLI;
class Image;
class Sound;
class Material;
class Skinner;
class Camera;
class ParticleEmitter;

/// <#Description#>
class WorldResourceLoader : public AbstractObject {

    friend class Image;

public:
    using AbstractDecorator::setName;
    using AbstractDecorator::getName;

    /**
         *  @author James Folk, 16-02-11 18:02:19
         *
         *  @brief <#Description#>
         */
    WorldResourceLoader();

    /**
         *  @author James Folk, 16-02-11 18:02:24
         *
         *  @brief <#Description#>
         *
         *  @param getClassName <#getClassName description#>
         *
         *  @return <#return value description#>
         */
    virtual ~WorldResourceLoader();

    /**
         *  @author James Folk, 16-02-11 18:02:30
         *
         *  @brief <#Description#>
         *
         *  @return <#return value description#>
         */
    virtual const char* getClassName() const;

    /**
         *  @author James Folk, 16-02-11 18:02:33
         *
         *  @brief <#Description#>
         *
         *  @return <#return value description#>
         */
    virtual s32 getType() const;

    /**
         *  @author James Folk, 16-02-11 18:02:39
         *
         *  @brief <#Description#>
         *
         *  @return <#return value description#>
         */
    virtual operator std::string() const;
    //TODO: fill in specific methods for WorldLuaVirtualMachine
public:
    /**
         *  @author James Folk, 16-02-11 18:02:43
         *
         *  @brief <#Description#>
         *
         *  @param filePath <#filePath description#>
         *  @param img      <#img description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* filePath, Image& img);

    /**
         *  @author James Folk, 16-02-11 18:02:48
         *
         *  @brief <#Description#>
         *
         *  @param file    <#file description#>
         *  @param emitter <#emitter description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, ParticleEmitter* emitter);

    /**
         *  @author James Folk, 16-02-11 18:02:52
         *
         *  @brief <#Description#>
         *
         *  @param vertexFile   <#vertexFile description#>
         *  @param fragmentFile <#fragmentFile description#>
         *  @param shader       <#shader description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* vertexFile,
        const char* fragmentFile,
        ShaderProgram* shader);

    /**
         *  @author James Folk, 16-02-11 18:02:57
         *
         *  @brief <#Description#>
         *
         *  @param file  <#file description#>
         *  @param sound <#sound description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, Sound* sound); //Sound

    /**
         *  @author James Folk, 16-02-11 18:02:01
         *
         *  @brief <#Description#>
         *
         *  @param file  <#file description#>
         *  @param light <#light description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, Light* light); //aiLight

    /**
         *  @author James Folk, 16-02-11 18:02:05
         *
         *  @brief <#Description#>
         *
         *  @param file <#file description#>
         *  @param geo  <#geo description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, Geometry* geo); //aiMesh

    /**
         *  @author James Folk, 16-02-11 18:02:08
         *
         *  @brief <#Description#>
         *
         *  @param file <#file description#>
         *  @param font <#font description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, Font* font); //Font

    /**
         *  @author James Folk, 16-02-11 18:02:12
         *
         *  @brief <#Description#>
         *
         *  @param file <#file description#>
         *  @param lua  <#lua description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, Lua* lua); //Lua

    /**
         *  @author James Folk, 16-02-11 18:02:15
         *
         *  @brief <#Description#>
         *
         *  @param file <#file description#>
         *  @param xml  <#xml description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, Xml* xml); //Xml

    /**
         *  @author James Folk, 16-02-11 18:02:19
         *
         *  @brief <#Description#>
         *
         *  @param file <#file description#>
         *  @param json <#json description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, JsonJLI* json); //JsonJLI

    /**
         *  @author James Folk, 16-02-11 18:02:23
         *
         *  @brief <#Description#>
         *
         *  @param file     <#file description#>
         *  @param material <#material description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, Material* material); //aiMaterial

    /**
         *  @author James Folk, 16-02-11 18:02:27
         *
         *  @brief <#Description#>
         *
         *  @param file    <#file description#>
         *  @param skinner <#skinner description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, Skinner* skinner);

    /**
         *  @author James Folk, 16-02-11 18:02:30
         *
         *  @brief <#Description#>
         *
         *  @param file   <#file description#>
         *  @param camera <#camera description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* file, Camera* camera); //aiCamera

    /**
         *  @author James Folk, 16-02-11 18:02:35
         *
         *  @brief <#Description#>
         *
         *  @param filePath  <#filePath description#>
         *  @param content   <#content description#>
         *  @param file_size <#file_size description#>
         *
         *  @return <#return value description#>
         */
    bool load(const char* filePath, const void** content, unsigned long* file_size);

    /**
         *  @author James Folk, 16-02-11 21:02:52
         *
         *  @brief <#Description#>
         *
         *  @param filePath <#filePath description#>
         *  @param password       <#"" description#>
         *
         *  @return <#return value description#>
         */
    bool loadZip(const char* filePath, const char* password = "");

    /**
         *  @author James Folk, 16-02-11 18:02:51
         *
         *  @brief <#Description#>
         *
         *  @param file <#file description#>
         *
         *  @return <#return value description#>
         */
    bool unLoad(const char* file);

    /**
         *  @author James Folk, 16-02-11 18:02:54
         *
         *  @brief <#Description#>
         *
         *  @return <#return value description#>
         */
    bool unLoadAll();

    /**
         *  @author James Folk, 16-02-11 18:02:57
         *
         *  @brief <#Description#>
         *
         *  @param filePath <#filePath description#>
         *  @param buff     <#buff description#>
         *  @param length   <#length description#>
         *
         *  @return <#return value description#>
         */
    bool loadDataFromFile(const char* filePath, const void** buff, unsigned long* length);

protected:
    bool setPvrImage(const char *filePath, Image &img);
    bool isLoaded(const char* file);
    njliFileType getType(const char* file) const;

    void remove(const char* file);

    const void* addFileData(const char* filePath, const void* buffer, unsigned long size);
    FileData* createFileData(const char* filePath, const void* buffer, s32 size);

    bool removeFileData(const char* filePath);
    bool getFileData(const char* filePath, const void** buffer = NULL, unsigned long* size = NULL) const;

private:
    WorldResourceLoader(const WorldResourceLoader&);
    WorldResourceLoader& operator=(const WorldResourceLoader&);

    std::vector<std::string> m_HashKeys;
    btHashMap<btHashString, FileData*> m_FileData;
};
}

#endif /* defined(__JLIGameEngineTest__WorldResourceLoaderWorldResourceLoader__) */
