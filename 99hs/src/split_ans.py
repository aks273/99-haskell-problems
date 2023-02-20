with open('learnyouahaskell_lists.hs', 'r') as oldFile:
    data = oldFile.read()
    solutions = data.split('\n\n')

    for i, solution in enumerate(solutions):
        if i == 0:
            continue

        with open('q{}.hs'.format(i+1), 'w') as newFile:
            funcName = solution.split(' ')[0]
            newFile.write('module Q{}({}) where\n\n'.format(i+1, funcName))
            newFile.write('import Test.QuickCheck\n\n')
            newFile.write(solution)
