package serverest;

import com.intuit.karate.junit5.Karate;

public class ServerestTest {

    @Karate.Test
    Karate testUser() {
        return Karate.run("users/users-post").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTag() {
        return Karate.run("users/users-post").tags("@post_users").relativeTo(getClass());
    }

}
