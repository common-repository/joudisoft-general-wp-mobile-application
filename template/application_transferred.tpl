{% parts/header.tpl %}
    ?$NOTICES
      <div class="row">
          <div class="col-md-offset-1 col-md-10 col-sm-12 col-xs-12">
            [$NOTICES]
                <p class="alert alert-{$type} font-16">{$text}</p>
            [/$NOTICES]
          </div>
      </div>
    $NOTICES?
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="dis-block width-100per text-center">
              <h3 class="mar-t-10 mar-b-20 text-bold">
                <i class="fa fa-check fw-rl10"></i>Application Has Been Transferred
              </h3>
              <div class="alert alert-success box-rounded">
                <p class="lead line-height-2em pad-b-10">Well done! your appliction has been successfully transferred</p>
                <button class="btn btn-default btn-lg btn-block auto-margin" onclick="window.location.reload();">
                  <i class="fa fa-caret-right fw-rl10"></i>
                  Click here to continue
                <i class="fa fa-caret-left fw-l10"></i>
                </button>
              </div>
            </div>
        </div>
    </div>
{% parts/footer.tpl %}
