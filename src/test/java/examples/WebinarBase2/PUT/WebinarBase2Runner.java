package examples.WebinarBase2.PUT;

import com.intuit.karate.junit5.Karate;

class WebinarBase2Runner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("PUTusuarios.feature").relativeTo(getClass());
        //return Karate.run("POST_usuarios.feature").tags("@testUnico").relativeTo(getClass());
        //return Karate.run().tags("@testUnico").relativeTo(getClass());

        //testBuilder.tags("@auth"); bancoBV
        //testBuilder.tags("@auth").tags("-@ignore"); bancoBV
    }
}
