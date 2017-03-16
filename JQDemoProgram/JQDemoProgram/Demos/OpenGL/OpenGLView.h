//
//  OpenGLView.h
//  JQDemoProgram
//
//  Created by Whisper-JQ on 16/2/29.
//  Copyright © 2016年 JQTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

@interface OpenGLView : UIView

@property (nonatomic, strong) CAEAGLLayer *eaglLayer;
@property (nonatomic, strong) EAGLContext *context;
@property (nonatomic, assign) GLuint colorRenderBuffer;
@property (nonatomic, assign) GLuint projectionUniform;
@property (nonatomic, assign) GLuint modelViewUniform;
@property (nonatomic, assign) float currentRotation;
@property (nonatomic, assign) GLuint depthRenderBuffer;

// texture
@property (nonatomic, assign) GLuint floorTexture;
@property (nonatomic, assign) GLuint fishTexture;
@property (nonatomic, assign) GLuint texCoordSlot;
@property (nonatomic, assign) GLuint textureUniform;


@end
