
function bind_imu_calculator(){
    var $wholesale_cost_field = $("#style_wholesale_cost");
    var $negotiated_cost_field = $("#style_negotiated_cost");
    var $retail_price_field = $("#style_retail_price");


    calculate_imu( $wholesale_cost_field.val(), $negotiated_cost_field.val(), $retail_price_field.val() );

    $retail_price_field.keyup(function(){
        calculate_imu( $wholesale_cost_field.val(), $negotiated_cost_field.val(), $retail_price_field.val() );
    });
    $negotiated_cost_field.keyup(function(){
        calculate_imu( $wholesale_cost_field.val(), $negotiated_cost_field.val(), $retail_price_field.val() );
    });
    $wholesale_cost_field.keyup(function(){
      calculate_imu( $wholesale_cost_field.val(), $negotiated_cost_field.val(), $retail_price_field.val() );
    })

}




function calculate_imu(wholesale_cost, negotiated_cost, retail_price){

    var total = ( ( (parseFloat(retail_price)) - wholesale_or_negotiated_cost(wholesale_cost, negotiated_cost) ) / parseFloat(retail_price) ) * 100
    total = total || 0
    render_imu_to_page(total.toFixed(2));
}


function render_imu_to_page(calculated_imu){

   $('#imu-data-display').html(calculated_imu + '%')
}


function wholesale_or_negotiated_cost(wholesale_cost, negotiated_cost){

   var cost = 0
   var wholesale_cost = parseFloat(wholesale_cost);
   var negotiated_cost = parseFloat(negotiated_cost);


    if (negotiated_cost >= 0 ){
      cost = negotiated_cost

    }else if(wholesale_cost >= 0){
      cost = wholesale_cost
    }

    return cost

}
