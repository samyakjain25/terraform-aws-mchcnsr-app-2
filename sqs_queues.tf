resource "aws_sqs_queue" "landmark_main_queue" {
    name                         = "LANDMARK_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "landmark_fu_queue" {
    name                         = "LANDMARK_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "experience_main_queue" {
    name                         = "EXPERIENCE_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "experience_fu_queue" {
    name                         = "EXPERIENCE_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "digital_asset_main_queue" {
    name                         = "DIGITAL_ASSET_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "digital_asset_fu_queue" {
    name                         = "DIGITAL_ASSET_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "vacation_main_queue" {
    name                         = "VACATION_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "vacation_fu_queue" {
    name                         = "VACATION_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "movie_main_queue" {
    name                         = "MOVIE_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "movie_fu_queue" {
    name                         = "MOVIE_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "culinary_main_queue" {
    name                         = "CULINARY_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "culinary_fu_queue" {
    name                         = "CULINARY_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "culinary_voucher_main_queue" {
    name                         = "CULINARY_VOUCHER_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "culinary_voucher_fu_queue" {
    name                         = "CULINARY_VOUCHER_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "article_main_queue" {
    name                         = "ARTICLE_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "article_fu_queue" {
    name                         = "ARTICLE_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "trip_main_queue" {
    name                         = "TRIP_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "trip_fu_queue" {
    name                         = "TRIP_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "hotel_main_queue" {
    name                         = "HOTEL_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "hotel_fu_queue" {
    name                         = "HOTEL_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}
resource "aws_sqs_queue" "flight_main_queue" {
    name                         = "FLIGHT_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "flight_fu_queue" {
    name                         = "FLIGHT_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "promo_main_queue" {
    name                         = "PROMO_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "promo_fu_queue" {
    name                         = "PROMO_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}


resource "aws_sqs_queue" "xperience_main_queue" {
    name                         = "XPERIENCE_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "xperience_fu_queue" {
    name                         = "XPERIENCE_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}


resource "aws_sqs_queue" "accommodation_main_queue" {
    name                         = "ACCOMMODATION_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "accommodation_fu_queue" {
    name                         = "ACCOMMODATION_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}


resource "aws_sqs_queue" "accommodation_entity_main_queue" {
    name                         = "ACCOMMODATION_ENTITY_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "accommodation_entity_fu_queue" {
    name                         = "ACCOMMODATION_ENTITY_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}


resource "aws_sqs_queue" "culinary_asset_main_queue" {
    name                         = "CULINARY_ASSET_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "culinary_asset_fu_queue" {
    name                         = "CULINARY_ASSET_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "xperience_category_main_queue" {
    name                         = "XPERIENCE_CATEGORY_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "xperience_category_fu_queue" {
    name                         = "XPERIENCE_CATEGORY_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}


resource "aws_sqs_queue" "xperience_geo_recommendation_main_queue" {
    name                         = "XPERIENCE_GEO_RECOMMENDATION_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "xperience_geo_recommendation_fu_queue" {
    name                         = "XPERIENCE_GEO_RECOMMENDATION_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}


resource "aws_sqs_queue" "points_main_queue" {
    name                         = "POINTS_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "points_fu_queue" {
    name                         = "POINTS_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}


resource "aws_sqs_queue" "culinary_treat_main_queue" {
    name                         = "CULINARY_TREAT_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "culinary_treat_fu_queue" {
    name                         = "CULINARY_TREAT_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "landmark_flexible_main_queue" {
    name                         = "LANDMARK_FLEXIBLE_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "landmark_flexible_fu_queue" {
    name                         = "LANDMARK_FLEXIBLE_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}


resource "aws_sqs_queue" "multi_category_main_queue" {
    name                         = "MULTI_CATEGORY_MAIN_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}

resource "aws_sqs_queue" "multi_category_fu_queue" {
    name                         = "MULTI_CATEGORY_FU_QUEUE"
    receive_wait_time_seconds    = "${var.receive_wait_time_seconds}"
    visibility_timeout_seconds   = "${var.visibility_timeout_seconds}"
    message_retention_seconds    = "${var.message_retention_seconds}"
}



