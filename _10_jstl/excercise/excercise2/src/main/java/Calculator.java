public class Calculator {

    public static double calculate(double firstOperand, double secondOperand, String operand ) {
        switch (operand){
            case "+":
                return firstOperand + secondOperand;
            case"-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                if(secondOperand != 0)
                    return firstOperand / secondOperand;
                else
                    throw new ArithmeticException("Exception: divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
