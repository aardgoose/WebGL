
/*
** Copyright (c) 2012 The Khronos Group Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
**
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
**
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/


attribute vec4 gtf_Color;
attribute vec4 gtf_Vertex;
uniform mat4 gtf_ModelViewProjectionMatrix;
varying vec4 color;

void main (void)
{
	const float M_PI = 3.14159265358979323846;
	vec3 c = 0.5 * M_PI * 2.0 * (gtf_Color.rgb - 0.5);
	vec3 o;
	if(abs(c.r) < 0.5)   // -45..45
		o.r = 0.5 * tan(c.r) + 0.5;
	else   // 45..90, -45..-90
		o.r = 0.5 / tan(c.r) + 0.5;

	if(abs(c.g) < 0.5)   // -45..45
		o.g = 0.5 * tan(c.g) + 0.5;
	else   // 45..90, -45..-90
		o.g = 0.5 / tan(c.g) + 0.5;

	if(abs(c.b) < 0.5)   // -45..45
		o.b = 0.5 * tan(c.b) + 0.5;
	else   // 45..90, -45..-90
		o.b = 0.5 / tan(c.b) + 0.5;

	color = vec4(o, 1.0);
	gl_Position = gtf_ModelViewProjectionMatrix * gtf_Vertex;
}
