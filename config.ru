require_relative "./config/environment"

use Rack::MethodOverride

use SessionsController
use ItemsController
use LocationsController

run ApplicationController