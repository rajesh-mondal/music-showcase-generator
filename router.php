<?php

$path = parse_url( $_SERVER['REQUEST_URI'], PHP_URL_PATH );

// If the request is for the API endpoint directly
if ( $path === '/api.php' ) {
    require __DIR__ . '/public/api.php';
    return true;
}

// If the request uses the full path
if ( $path === '/public/api.php' ) {
    require __DIR__ . '/public/api.php';
    return true;
}

// Handle static files (index.html, CSS, JS, etc.) ---
if ( file_exists( $_SERVER['DOCUMENT_ROOT'] . $path ) ) {
    return false;
}

// If the request doesn't match the API and isn't a static file, return 404.
http_response_code( 404 );
echo "404 - Not Found for path: " . $path;
return true;