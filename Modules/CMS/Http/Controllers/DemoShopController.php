<?php

namespace Modules\CMS\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\DemoShop;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;

class DemoShopController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('demo-shops/Index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('demo-shops/Create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'link' => 'required|url|max:500',
            'logo' => 'nullable|url|max:500',
            'description' => 'nullable|string|max:1000',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            $demoShop = DemoShop::create($validator->validated());

            return response()->json([
                'success' => true,
                'message' => 'Demo shop created successfully',
                'data' => $demoShop
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to create demo shop: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(DemoShop $demoShop)
    {
        return response()->json([
            'success' => true,
            'data' => $demoShop
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(DemoShop $demoShop)
    {
        return Inertia::render('demo-shops/Edit', [
            'demoShop' => $demoShop
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, DemoShop $demoShop)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'link' => 'required|url|max:500',
            'logo' => 'nullable|url|max:500',
            'description' => 'nullable|string|max:1000',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            $demoShop->update($validator->validated());

            return response()->json([
                'success' => true,
                'message' => 'Demo shop updated successfully',
                'data' => $demoShop->fresh()
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update demo shop: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(DemoShop $demoShop)
    {
        try {
            $demoShop->delete();

            return response()->json([
                'success' => true,
                'message' => 'Demo shop deleted successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to delete demo shop: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get all demo shops for admin (including soft deleted)
     */
    public function adminIndex()
    {
        try {
            $demoShops = DemoShop::withTrashed()->orderBy('created_at', 'desc')->get();

            return response()->json([
                'success' => true,
                'data' => $demoShops
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch demo shops: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Restore a soft deleted demo shop
     */
    public function restore($id)
    {
        try {
            $demoShop = DemoShop::withTrashed()->findOrFail($id);
            $demoShop->restore();

            return response()->json([
                'success' => true,
                'message' => 'Demo shop restored successfully',
                'data' => $demoShop->fresh()
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to restore demo shop: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Permanently delete a demo shop
     */
    public function forceDelete($id)
    {
        try {
            $demoShop = DemoShop::withTrashed()->findOrFail($id);
            $demoShop->forceDelete();

            return response()->json([
                'success' => true,
                'message' => 'Demo shop permanently deleted'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to permanently delete demo shop: ' . $e->getMessage()
            ], 500);
        }
    }
}