package examples.WebinarBase2.GET;

import com.intuit.karate.junit5.Karate;

class WebinarBase2Runner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("usuarios.feature").relativeTo(getClass());
        //return Karate.run("post_usuarios.feature").tags("@testUnico").relativeTo(getClass());
        //return Karate.run().tags("@testUnico").relativeTo(getClass());

        //testBuilder.tags("@auth"); bancoBV
        //testBuilder.tags("@auth").tags("-@ignore"); bancoBV
    }
}
