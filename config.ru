require_relative "./config/environment"

use Rack::MethodOverride

use ItemsController
use LocationsController

run ApplicationController