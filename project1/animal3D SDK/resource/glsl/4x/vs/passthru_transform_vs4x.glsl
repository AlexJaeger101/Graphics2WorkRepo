/*
	Copyright 2011-2021 Daniel S. Buckstein

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/

/*
	animal3D SDK: Minimal 3D Animation Framework
	By Daniel S. Buckstein
	
	passthru_transform_vs4x.glsl
	Pass-thru GLSL vertex shader. Outputs transformed position attribute.
*/

#version 450

// ****DONE: 
//	-> declare model-view-projection matrix uniform
//		(hint: correct name is used in codebase)
//	-> transform input position by MVP matrix, store as output

layout (location = 0) in vec4 aPosition;

uniform mat4 uMVP; //model view projection matrix

flat out int vVertexID;
flat out int vInstanceID;

void main()
{
	// DUMMY OUTPUT: directly assign input position to output position
	//gl_Position = aPosition;
	gl_Position = uMVP * aPosition; //never forget, right to left :)

	vVertexID = gl_VertexID;
	vInstanceID = gl_InstanceID;
}
