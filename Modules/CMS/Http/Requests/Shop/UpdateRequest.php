<?php

namespace Modules\CMS\Http\Requests\Shop;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        return [
            'name' => 'required',
            'phone_number' => 'nullable|digits_between:10,11',
            'province' => 'nullable|string',
            'prefecture' => 'nullable|string',
            'town' => 'string|nullable',
            'address' => 'string|nullable',
            'status' => 'required',
            'api_key' => 'required|string',
            'request_key_flag' => 'nullable',
            'update_at' => 'nullable|string',
            'current_subscription' => 'nullable',
            'domain' => 'required|string',
        ];
    }

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Category name is required.',
            'status.required' => 'Category status is required.',
        ];
    }
}
