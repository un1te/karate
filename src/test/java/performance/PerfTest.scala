package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration.DurationInt
import scala.language.postfixOps


class PerfTest extends Simulation {

  val protocol = karateProtocol(
    "/api/articles/{id}" -> Nil
  )
  val csvFeeder = csv("articles.csv").circular

  //  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")

  val create = scenario("Create_and_delete_article").feed(csvFeeder).exec(karateFeature("classpath:performance/CreateArticle.feature"))

  setUp(
    create.inject(
      atOnceUsers(1),
      nothingFor(1 seconds),
      constantUsersPerSec(1) during (3 seconds),
//      constantUsersPerSec(2) during (10 seconds),
//      rampUsersPerSec(2) to 10 during (20 seconds),
//      nothingFor(5 seconds),
//      constantUsersPerSec(1) during (5 seconds)
    ).protocols(protocol)

  )

}