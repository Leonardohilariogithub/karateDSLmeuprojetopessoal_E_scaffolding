package examples.marcosCunhaAllTests;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("feature").relativeTo(getClass());

        //testBuilder.tags("@auth"); banco BV
        //testBuilder.tags("@auth").tags("-@ignore"); banco BV
    }

}
