
/*
Copyright (c) 2019 The Khronos Group Inc.
Use of this source code is governed by an MIT-style license that can be
found in the LICENSE.txt file.
*/


attribute vec4 gtf_Vertex;
attribute vec4 gtf_Color;
uniform mat4 gtf_ModelViewProjectionMatrix;
varying vec4 color;

void main (void)
{
	const float M_PI = 3.14159265358979323846;
	vec2 c = 4.0 * 2.0 * (gtf_Color.rg - 0.5);
	vec2 atan_c = vec2(0.0);
	vec2 scale = vec2(1.0);
	vec2 sign = vec2(1.0);
	vec4 result = vec4(0.0, 0.0, 0.0, 1.0);

	if(c[0] < 0.0)
	{
		sign[0] = -1.0;
		c[0] *= -1.0;
	}

	if(c[0] <= 1.0)
	{
		// Taylors series expansion for atan
		atan_c[0] += scale[0] * pow(c[0], float(1)) / float(1);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(3)) / float(3);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(5)) / float(5);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(7)) / float(7);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(9)) / float(9);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(11)) / float(11);
		scale[0] *= -1.0;

		result[0] = sign[0] * atan_c[0] / M_PI + 0.5;
	}
	else
	{
		c[0] = 1.0 / c[0];

		// Taylors series expansion for atan
		atan_c[0] += scale[0] * pow(c[0], float(1)) / float(1);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(3)) / float(3);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(5)) / float(5);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(7)) / float(7);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(9)) / float(9);
		scale[0] *= -1.0;
		atan_c[0] += scale[0] * pow(c[0], float(11)) / float(11);
		scale[0] *= -1.0;

		result[0] = sign[0] * (M_PI / 2.0 - atan_c[0]) / M_PI + 0.5;
	}


	if(c[1] < 0.0)
	{
		sign[1] = -1.0;
		c[1] *= -1.0;
	}

	if(c[1] <= 1.0)
	{
		// Taylors series expansion for atan
		atan_c[1] += scale[1] * pow(c[1], float(1)) / float(1);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(3)) / float(3);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(5)) / float(5);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(7)) / float(7);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(9)) / float(9);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(11)) / float(11);
		scale[1] *= -1.0;

		result[1] = sign[1] * atan_c[1] / M_PI + 0.5;
	}
	else
	{
		c[1] = 1.0 / c[1];

		// Taylors series expansion for atan
		atan_c[1] += scale[1] * pow(c[1], float(1)) / float(1);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(3)) / float(3);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(5)) / float(5);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(7)) / float(7);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(9)) / float(9);
		scale[1] *= -1.0;
		atan_c[1] += scale[1] * pow(c[1], float(11)) / float(11);
		scale[1] *= -1.0;

		result[1] = sign[1] * (M_PI / 2.0 - atan_c[1]) / M_PI + 0.5;
	}

	color = result;
	gl_Position = gtf_ModelViewProjectionMatrix * gtf_Vertex;
}
