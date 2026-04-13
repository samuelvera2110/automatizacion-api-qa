package petstore;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;

@Execution(ExecutionMode.SAME_THREAD)
public class PetStoreRunnerTest {
    @Test
    void testPetstoreFlow() {
        Results results = Runner.path("classpath:petstore/PetStoreTest.feature")
                .outputHtmlReport(true)
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}