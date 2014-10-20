Feature: Avalia a Prática 3.2 de IF62C-Fundamentos de Programação 2
    Como professor da disciplica de Fundamentos de Programação 2
    Quero avaliar a prática 3.2
    A fim de verificar a compreensão dos estudantes

    Background:
        Given the maximum grade is 100
        Given the main class is 'Pratica32'
        Given I set the script timeout to 3000
        Given I evaluate 'import utfpr.ct.dainf.grader.*'
        Given I evaluate 'import java.util.regex.*'
    
    Scenario: Verifica se a classe existe no pacote padrão e contem o método main (20 pontos)
        Given I report 'Iniciando avaliação...'
        Given I report 'Avaliando item 3...'
        Given class 'Pratica32' exists somewhere store class in <mainClass>
        Then award 5 points
        Given the class <mainClass> is in the 'default' package
        And class <mainClass> has 'public' modifier
        Then award 5 points
        Given class <mainClass> declares 'main(java.lang.String[])' method save in <mainMethod>
        And method <mainMethod> returns type 'void'
        And member <mainMethod> has 'public' modifier
        And member <mainMethod> has 'static' modifier
        Then award 10 points

    Scenario: Verifica se o método densidade foi corretamente declarado (20 pontos)
        Given I report 'Avaliando item 4...'
        Given class <mainClass> declares 'densidade(double,double,double)' method save in <densidadeMethod>
        And member <densidadeMethod> has 'public' modifier
        And member <densidadeMethod> has 'static' modifier
        And method <densidadeMethod> returns type 'double'
        Then award 20 points

    Scenario: Verifica o método densidade retorna o resultado correto (40 pontos)
        Given I report 'Avaliando item 5...'
        Given I evaluate 'xt = Math.random() * 3 + 1'
        Given I evaluate 'mt = Math.random() * 3 + 1'
        Given I evaluate 'dt = Math.random() * 3 + 1'
        And I evaluate 'densTest = TestUtils.densidade(xt, mt, dt)'
        And I evaluate 'dens = Pratica32.densidade(xt, mt, dt)'
        And expression 'Math.abs(densTest - dens) < 0.0001' evaluates to <true>
        Then award 40 points

    Scenario: Verifica se exibe o valor calculado (20 pontos)
        Given I report 'Avaliando item 6...'
        Given I evaluate 'testMain = new Pratica32()'
        Given I set output to <testOut>
        And I evaluate 'testMain.main(new String[0])'
        And I set output to <default>
        Given I evaluate 'outRegex = ".*" + String.valueOf(Pratica32.densidade(-1,67,3)).substring(0,6) + ".*"'
        And <testOut> matches regex <outRegex> with 'Pattern.DOTALL' option
        Then award 20 points

    Scenario: Report final grade.
        Given I report grade formatted as 'FINAL GRADE: %.1f'
