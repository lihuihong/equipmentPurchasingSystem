package com.dsp.equipment.utils.aop;

import java.lang.annotation.*;

@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface Describe {

    public String opModule();
    public int opType();
    public String opContent();
}
