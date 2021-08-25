<?php

namespace App\Traits;

trait ApiResponse
{
    private function apiResponse($data, $code)
    {
        return response()->json($data, $code);
    }

    protected function errorResponse($message = 'Something went wrong', $errors = [], $code = 400)
    {
        return $this->apiResponse([
            'success' => false,
            'message' => $message,
            'errors' => $message,
            'code' => $code
        ], $code);
    }

    protected function successResponse($message, $data = null, $code = 200)
    {
        return response()->json(
            [
                'success' => true,
                'message' => $message,
                'data' => $data,
                'code' => $code
            ]);
    }
}
