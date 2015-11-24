// Copyright © 2015 Venture Media Labs.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

public enum QuadraticArrangement {
    /// Consecutive elements in a rows are contiguous in memory
    case RowMajor

    /// Consecutive elements in a column are contiguous in memory
    case ColumnMajor
}

public protocol QuadraticType {
    typealias Element

    /// The arrangement of rows and columns
    var arragement: QuadraticArrangement { get }

    /// The pointer to the beginning of the memory block
    var pointer: UnsafePointer<Element> { get }

    /// The number of rows
    var rows: Int { get }

    /// The number of columns
    var columns: Int { get }

    /// The step size between major-axis elements
    var stride: Int { get }
}

public extension QuadraticType {
    /// The number of valid element in the memory block, taking into account the step size.
    public var count: Int {
        return rows * columns
    }
}

public protocol MutableQuadraticType : QuadraticType {
    /// The mutable pointer to the beginning of the memory block
    var mutablePointer: UnsafeMutablePointer<Element> { get }
}
