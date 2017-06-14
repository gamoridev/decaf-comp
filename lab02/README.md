# ANTLR Project

Originally posted at MIT Open Courseware: https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/

# Compilar
Para compilar o arquivo deve se usar o código a baixo;

java -jar dist/Compiler.jar -target inter ../jose.dcf

Caso queira alterar o tipo de verificação deve-se trocar o targuet, para um destes três
inter, parse ou scan.

Caso queira visualizar a arvore do código que está tentando compilar deve-se usar o código a baixo:

java -jar dist/Compiler.jar -target inter -debug ../jose.dcf

Usando o targuet inter e o comando -debug é possivel ver a arvore no terminal.

jose.dcf é um exemplo de caminho.