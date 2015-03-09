#include <ight/common/settings.hpp>
#include <ight/ooni/http_invalid_request_line.hpp>
#include <ight/common/log.h>

using namespace ight::common;
using namespace ight::ooni::http_invalid_request_line;

int main(int argc, char *argv[]) {
    ight_set_verbose(1);
    ight::common::Settings options;
    options["backend"] = "http://google.com/";
    HTTPInvalidRequestLine http_invalid_request_line(options);
    http_invalid_request_line.begin([&](){
        http_invalid_request_line.end([](){
            ight_break_loop();
        });
    });
    ight_loop();
}
