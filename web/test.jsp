<%-- 
    Document   : test
    Created on : Mar 2, 2022, 11:58:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div
                id="app"
                :class="progressClasses"
                >
                <div class="progress__bg"></div>
                <template v-for="(step, index) in steps">
                    <div :class="stepClasses(index)">
                        <div class="progress__indicator">
                            <i class="fa fa-check"></i>
                        </div>
                        <div class="progress__label">
                            {{step.label}}
                        </div>
                    </div>
                </template>

                <div class="progress__actions">
                    <div
                        class="btn"
                        v-on:click="nextStep(false)"
                        >
                        Back
                    </div>
                    <div
                        class="btn"
                        v-on:click="nextStep"
                        >
                        Next
                    </div>
                    <div>
                        Step:
                        {{currentStep ? currentStep.label : "Start"}}
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
