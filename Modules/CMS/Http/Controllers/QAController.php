<?php

namespace Modules\CMS\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\QA;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;

class QAController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = QA::query();

        // Search functionality
        if ($request->has('search') && $request->search) {
            $query->where('question', 'like', '%' . $request->search . '%')
                  ->orWhere('answer', 'like', '%' . $request->search . '%');
        }

        // Filter by status
        if ($request->has('status') && $request->status !== '') {
            $query->where('status', $request->status);
        }

        $qas = $query->orderBy('created_at', 'desc')
                    ->paginate(10)
                    ->withQueryString();

        return Inertia::render('qa/Index', [
            'qas' => $qas,
            'filters' => $request->only(['search', 'status'])
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('qa/Create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'question' => 'required|string|max:1000',
            'answer' => 'required|string',
            'status' => 'boolean'
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        QA::create([
            'question' => $request->question,
            'answer' => $request->answer,
            'status' => $request->status ?? true
        ]);

        return redirect()->route('cms.qa.index')
                        ->with('success', 'Câu hỏi đã được tạo thành công!');
    }

    /**
     * Display the specified resource.
     */
    public function show(QA $qa)
    {
        return Inertia::render('qa/Show', [
            'qa' => $qa
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(QA $qa)
    {
        return Inertia::render('qa/Edit', [
            'qa' => $qa
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, QA $qa)
    {
        $validator = Validator::make($request->all(), [
            'question' => 'required|string|max:1000',
            'answer' => 'required|string',
            'status' => 'boolean'
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $qa->update([
            'question' => $request->question,
            'answer' => $request->answer,
            'status' => $request->status ?? true
        ]);

        return redirect()->route('cms.qa.index')
                        ->with('success', 'Câu hỏi đã được cập nhật thành công!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(QA $qa)
    {
        $qa->delete();

        return redirect()->route('cms.qa.index')
                        ->with('success', 'Câu hỏi đã được xóa thành công!');
    }

    /**
     * Toggle status of the specified resource.
     */
    public function toggleStatus(QA $qa)
    {
        $qa->update([
            'status' => !$qa->status
        ]);

        $message = $qa->status ? 'Câu hỏi đã được kích hoạt!' : 'Câu hỏi đã được vô hiệu hóa!';

        return redirect()->route('cms.qa.index')
                        ->with('success', $message);
    }

    /**
     * API endpoint for public Q&A display
     */
    public function apiIndex(Request $request)
    {
        $query = QA::active();

        // Search functionality for public
        if ($request->has('search') && $request->search) {
            $query->where('question', 'like', '%' . $request->search . '%')
                  ->orWhere('answer', 'like', '%' . $request->search . '%');
        }

        $qas = $query->orderBy('created_at', 'desc')
                    ->paginate(10)
                    ->withQueryString();

        return response()->json($qas);
    }
}