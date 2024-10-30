{% parts/header.tpl %}
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="dis-block width-100per text-center">
              <h3 class="mar-t-10 mar-b-20 text-bold text-red">
                <i class="fa fa-warning fw-rl10"></i>Missing Requirements
              </h3>
              <p class="font-16 line-height-2em pad-b-10">
                We're sorry to tell you that some requirements are missing from your web hosting, Please contact your web-hosting provider to correct the issue<br>
                Once required libraries installed / activated, refresh the page to start / continue using the plugin.
              </p>
              <div class="col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                <div class="alert bg-warning text-left">
                    <h4 class="text-bold text-red"><i class="fa fa-cogs fw-rl10"></i>Plugin Requires:</h4>
                    <ul class="list-unstyled">
                      ?$MISSED
                      [$MISSED]
                        <li class="dis-block pad-5 text-bold"><i class="fa fa-caret-right fw-rl5"></i>{$_item}</li>
                      [/$MISSED]
                      $MISSED?
                    </ul>
                </div>
              </div>
            </div>
        </div>
    </div>
{% parts/footer.tpl %}
