package examples.performance

import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder

class performanceSCALA extends Simulation {

  val protocol: KarateProtocol = karateProtocol()

 //protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  //protocol.runner.karateEnv("perf")

  val createUsuarios: ScenarioBuilder = scenario("create and delete usuarios").exec(karateFeature("classpath:examples/performance/performance1.feature"))

//  setUp(createUsuarios.inject(rampUsers(10) during (5 seconds)).protocols(protocol))
  setUp(
    createUsuarios.inject(
    atOnceUsers(1)
    ).protocols(protocol)
  )

}
