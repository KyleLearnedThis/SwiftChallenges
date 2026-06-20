---
description: Scaffold a new LeetCode problem — generates a solution stub, an empty XCTest file, and registers both into project.pbxproj.
argument-hint: problem=<"46. Permutations"> [prefix=<Prefix>] OR class=<ClassName> group=<Category> [prefix=<Prefix>]
---

# /leetcode — Scaffold a LeetCode Problem

Scaffold a new LeetCode problem in this SwiftChallenges Xcode project. Generates a solution stub and an empty XCTest file, then inserts both into `SwiftChallenges.xcodeproj/project.pbxproj` so Xcode picks them up automatically.

## Arguments

`$ARGUMENTS` accepts **one of two forms**:

### Form A — Auto-resolve from problem identity (preferred)
- `problem=<identifier>` — accepts a problem number, name, URL slug, or combined (e.g. `problem="46. Permutations"`, `problem="permutations"`, `problem=46`).
- `prefix=<string>` — optional. If provided and non-empty, prepend it to the class name (e.g. `prefix="Neet"` → `NeetPermutations`). If omitted or empty, use the bare PascalCase name (e.g. `Permutations`).

When `problem=` is provided, use your training knowledge to resolve:
- `class` — PascalCase class name, then apply prefix if set (e.g. `Permutations` → `NeetPermutations` when `prefix="Neet"`)
- `group` — category folder (e.g. `Backtracking`, `Trees`, `SlidingWindow`)
- `signature` — the exact LeetCode Swift function signature (e.g. `func permute(_ nums: [Int]) -> [[Int]]`)

Use `signature` in the solution template (Step 3) instead of `func solve()`.

### Form B — Explicit (fallback)
- `class=<ClassName>` — solution class & filename (no `.swift` suffix). PascalCase; include any desired prefix in the name itself, or use `prefix=` to have it applied automatically.
- `group=<Category>` — category folder name.
- `prefix=<string>` — optional. If provided and non-empty, prepend it to `class`.

When using Form B, use `func solve()` as the placeholder signature.

The test class name is **always** `<class>Test` and is derived automatically — do not accept a separate `test=` argument.

If `$ARGUMENTS` provides neither `problem=` nor both `class=` and `group=`, abort with an error listing what's missing and showing both valid invocation formats.

## Steps

### 1. Parse and validate arguments

Extract `class`, `group`, and optional `prefix` from `$ARGUMENTS`. `class` and `group` are required. If `prefix` is provided and non-empty, prepend it to `class` now (e.g. `class = prefix + class`). Derive `test = "${class}Test"` — never accept it from the user.

Verify both directories exist:
- `SwiftChallenges/NeetCode/$group/`
- `SwiftChallengesTests/NeetCode/$group/`

**If either is missing**, do NOT silently proceed. Use `AskUserQuestion` to confirm:

> Question: "The category `$group` doesn't exist yet — create it?"
> Header: "New category"
> Options:
>   - "Yes, create it" — create both folders AND register two new PBXGroups in `project.pbxproj` (see Step 6.f below), then continue.
>   - "No, abort" — stop without making any changes.

Only continue if the user picks "Yes". Never auto-create without confirmation.

### 2. Determine today's date

Use the bash command `date +%-m/%-d/%y` to get the date in the project's header format (e.g. `6/14/26`).

### 3. Write the solution file

Path: `SwiftChallenges/NeetCode/$group/$class.swift`

**Determine the default return value** from the return type in `$signature`:
- `-> [[T]]` or `-> [T]` → `return []`
- `-> Int` → `return 0`
- `-> String` → `return ""`
- `-> Bool` → `return false`
- `-> Double` or `-> Float` → `return 0.0`
- `-> T?` (any optional) → `return nil`
- `-> Void` or no return type → omit the return line entirely

Use this template. For Form B use `func solve()` and omit the return line:

```swift
//
//  $class.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on $today.
//

class $class {

    $signature {
        return $default
    }
}
```

### 4. Write the test file

Path: `SwiftChallengesTests/NeetCode/$group/${class}Test.swift`

**Form A (problem=):** Generate a full test suite using training knowledge of the problem. Follow this structure:

- **Private helpers** — add only what the comparison strategy requires:
  - Order-agnostic `[[T]]` results (e.g. permutations, subsets, combinations): add a `sorted()` helper that sorts inner arrays then outer array lexicographically, matching the NeetSubsets style.
  - Scalar or single-array results with a deterministic order: no helper needed; use `XCTAssertEqual` directly.
- **`verify()` wrapper** — always include one; it routes through the sut call and passes `file:` and `line:` so failures point to the callsite.
- **Test methods** — organised with `// MARK:` sections:
  - `// MARK: - Base cases` — empty input, single element, minimal valid input
  - `// MARK: - LeetCode examples` — every numbered example from the problem statement (testExample1, testExample2, …)
  - `// MARK: - Edge cases` — negatives, duplicates, boundary values, or property assertions (count, uniqueness) as appropriate to the problem

Use Swift value literals throughout — no variables, no setup beyond the sut.

**Form B (class= / group=):** Emit an empty test class only:

```swift
//
//  ${class}Test.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on $today.
//

import XCTest

class ${class}Test: XCTestCase {

    private let sut = $class()
}
```

### 5. Register both files in `SwiftChallenges.xcodeproj/project.pbxproj`

Generate five fresh 24-char uppercase hex IDs:

```bash
for i in 1 2 3 4 5; do openssl rand -hex 12 | tr 'a-f' 'A-F'; done
```

Name them `ID_SOL_REF`, `ID_SOL_BF_MAIN`, `ID_SOL_BF_TEST`, `ID_TEST_REF`, `ID_TEST_BF`.

Verify each is unique with `grep` against the existing pbxproj. Regenerate any collision.

Make the following five edits to `SwiftChallenges.xcodeproj/project.pbxproj`. Use the `Edit` tool with surrounding context unique enough to anchor each insertion. Match the surrounding tab indentation exactly.

**a) PBXBuildFile section** — add three lines anywhere inside `/* Begin PBXBuildFile section */ … /* End PBXBuildFile section */`:

```
		ID_SOL_BF_MAIN /* $class.swift in Sources */ = {isa = PBXBuildFile; fileRef = ID_SOL_REF /* $class.swift */; };
		ID_SOL_BF_TEST /* $class.swift in Sources */ = {isa = PBXBuildFile; fileRef = ID_SOL_REF /* $class.swift */; };
		ID_TEST_BF /* ${class}Test.swift in Sources */ = {isa = PBXBuildFile; fileRef = ID_TEST_REF /* ${class}Test.swift */; };
```

**b) PBXFileReference section** — add two lines anywhere inside `/* Begin PBXFileReference section */ … /* End PBXFileReference section */`:

```
		ID_SOL_REF /* $class.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = $class.swift; sourceTree = "<group>"; };
		ID_TEST_REF /* ${class}Test.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ${class}Test.swift; sourceTree = "<group>"; };
```

**c) Solution-side `$group` PBXGroup** — there are TWO groups named `$group` (one on each side). The solution-side one's parent is the NeetCode group whose `path = NeetCode;` lives in the solution tree. To disambiguate: grep the pbxproj for `/* $group */ = {` to find both group IDs, then look at the NeetCode group entries `FB49A3982F9F105F0013680A` (solution) and `FB49A3972F9F0FE70013680A` (test) to identify which group ID is referenced by which parent.

Insert into the solution-side group's `children = (...)`:
```
			ID_SOL_REF /* $class.swift */,
```

**d) Test-side `$group` PBXGroup** — insert into the test-side group's `children = (...)`:
```
			ID_TEST_REF /* ${class}Test.swift */,
```

**e) PBXSourcesBuildPhase** — there are two of these. The IDs are stable:

- Main app phase: `DECCEDF327FCF814007BA99C /* Sources */` — insert into its `files = (...)`:
  ```
  			ID_SOL_BF_MAIN /* $class.swift in Sources */,
  ```
- Test target phase: `DECCEDFD27FCF814007BA99C /* Sources */` — insert two lines into its `files = (...)`:
  ```
  			ID_SOL_BF_TEST /* $class.swift in Sources */,
  			ID_TEST_BF /* ${class}Test.swift in Sources */,
  ```

**f) (Only if creating a new category in Step 1)** — register two new PBXGroups:

First, `mkdir -p` both folders:
- `SwiftChallenges/NeetCode/$group/`
- `SwiftChallengesTests/NeetCode/$group/`

Generate two more 24-char uppercase hex IDs: `ID_GRP_SOL` (solution-side) and `ID_GRP_TEST` (test-side). Use them when wiring the children in steps (c) and (d) above.

Inside `/* Begin PBXGroup section */ … /* End PBXGroup section */`, add two new group blocks (tab indentation must match surrounding groups):

```
		ID_GRP_SOL /* $group */ = {
			isa = PBXGroup;
			children = (
				ID_SOL_REF /* $class.swift */,
			);
			path = $group;
			sourceTree = "<group>";
		};
		ID_GRP_TEST /* $group */ = {
			isa = PBXGroup;
			children = (
				ID_TEST_REF /* ${class}Test.swift */,
			);
			path = $group;
			sourceTree = "<group>";
		};
```

Then add the new group IDs as children of the two parent NeetCode groups (anchor IDs are stable):

- Solution-side NeetCode group `FB49A3982F9F105F0013680A /* NeetCode */` — append `ID_GRP_SOL /* $group */,` to its `children = (...)`.
- Test-side NeetCode group `FB49A3972F9F0FE70013680A /* NeetCode */` — append `ID_GRP_TEST /* $group */,` to its `children = (...)`.

When a new category is being created, steps (c) and (d) collapse into this — don't try to grep for an existing `$group` PBXGroup, just use the IDs you just generated.

After all edits, run `git diff SwiftChallenges.xcodeproj/project.pbxproj` and visually confirm only additive lines appear — no deletions or accidental reorderings.

### 6. Report

Print a concise summary:

```
✓ Created category $group (solution + test folders, PBXGroups registered)   ← only if applicable
✓ Created SwiftChallenges/NeetCode/$group/$class.swift
✓ Created SwiftChallengesTests/NeetCode/$group/${class}Test.swift
✓ Registered both files in project.pbxproj

Next:
  1. Open SwiftChallenges.xcodeproj in Xcode (Cmd+B to confirm the build is clean)
  2. Solve the algorithm in $class.swift
  3. Run tests — they should fail until the algorithm is correct
```

## Notes

- Do NOT implement the solution body beyond the default return — Kyle writes the algorithm himself.
- Do NOT write any comments in generated files beyond the standard Xcode header. No `// MARK:` sections, no strategy comments, no time/space complexity notes. Keep it minimal so Kyle has a blank canvas.
- The 24-char hex ID generator must produce uppercase hex; Xcode's convention is uppercase.
- Anchor IDs `DECCEDF327FCF814007BA99C` (main Sources) and `DECCEDFD27FCF814007BA99C` (test Sources) are stable for this project and may be hard-coded above.
