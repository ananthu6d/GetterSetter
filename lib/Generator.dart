enum Type { string, char, int, long, bool, float, double, charArray }

class MethodGenerator {
  // Function to extract the name after the last underscore
  String _extractAfterUnderscore(String varName) {
    int pos = varName.lastIndexOf('_');
    if (pos != -1) {
      return varName.substring(pos + 1);
    }
    return varName; // If no underscore, return the original name
  }

  // Function to capitalize the first letter of a string
  String _capitalizeFirstLetter(String varName) {
    if (varName.isEmpty) return varName;
    return varName[0].toUpperCase() + varName.substring(1);
  }

  // Function to generate setter for a given type and variable name
  String _generateSetter(Type type, String varName) {
    String methodName =
        "mcfn_set${_capitalizeFirstLetter(_extractAfterUnderscore(varName))}";
    switch (type) {
      case Type.string:
        return "void $methodName(String CL_${_extractAfterUnderscore(varName)}) { $varName = CL_${_extractAfterUnderscore(varName)}; }\n";
      case Type.char:
        return "void $methodName(char scL_${_extractAfterUnderscore(varName)}) { $varName = scL_${_extractAfterUnderscore(varName)}; }\n";
      case Type.charArray:
        return "void $methodName(char* pscL_${_extractAfterUnderscore(varName)}) { strcpy($varName, pscL_${_extractAfterUnderscore(varName)}); }\n";
      case Type.int:
        return "void $methodName(int siL_${_extractAfterUnderscore(varName)}) { $varName = siL_${_extractAfterUnderscore(varName)}; }\n";
      case Type.long:
        return "void $methodName(long slL_${_extractAfterUnderscore(varName)}) { $varName = slL_${_extractAfterUnderscore(varName)}; }\n";
      case Type.bool:
        return "void $methodName(bool bL_${_extractAfterUnderscore(varName)}) { $varName = bL_${_extractAfterUnderscore(varName)}; }\n";
      case Type.float:
        return "void $methodName(float fL_${_extractAfterUnderscore(varName)}) { $varName = fL_${_extractAfterUnderscore(varName)}; }\n";
      case Type.double:
        return "void $methodName(double dL_${_extractAfterUnderscore(varName)}) { $varName = dL_${_extractAfterUnderscore(varName)}; }\n";
      default:
        return "";
    }
  }

  // Function to generate getter for a given type and variable name
  String _generateGetter(Type type, String varName) {
    String methodName =
        "mcfn_get${_capitalizeFirstLetter(_extractAfterUnderscore(varName))}";
    switch (type) {
      case Type.string:
        return "String $methodName() { return $varName; }\n";
      case Type.char:
        return "char $methodName() { return $varName; }\n";
      case Type.charArray:
        return "char* $methodName() { return $varName; }\n";
      case Type.int:
        return "int $methodName() { return $varName; }\n";
      case Type.long:
        return "long $methodName() { return $varName; }\n";
      case Type.bool:
        return "bool $methodName() { return $varName; }\n";
      case Type.float:
        return "float $methodName() { return $varName; }\n";
      case Type.double:
        return "double $methodName() { return $varName; }\n";
      default:
        return "";
    }
  }

  // Function to process input and generate corresponding getter and setter methods
  String _processInput(List<MapEntry<Type, String>> variables) {
    StringBuffer sb = StringBuffer();

    // Generate Setter functions
    for (var varEntry in variables) {
      sb.write(_generateSetter(varEntry.key, varEntry.value));
    }

    // Generate Getter functions
    for (var varEntry in variables) {
      sb.write(_generateGetter(varEntry.key, varEntry.value));
    }

    return sb.toString();
  }

  // Function to parse the input string and extract variable types and names
  List<MapEntry<Type, String>> _parseInput(String input) {
    // Modify the regex to allow capturing variables with or without array size, like pscL_A[20] or pscL_A
    final RegExp pattern = RegExp(r'(\w+)\s+(\w+)(\[\d+\])?;');
    Iterable<RegExpMatch> matches = pattern.allMatches(input);
    List<MapEntry<Type, String>> variables = [];

    for (var match in matches) {
      String typeString = match.group(1)!;
      String varName = match.group(2)!; // Capture the variable name
      String arraySize = match.group(3) ?? ''; // Capture array size if present
      Type type;

      switch (typeString) {
        case 'String':
          type = Type.string;
          break;
        case 'char':
          type = arraySize.isNotEmpty ? Type.charArray : Type.char;
          break;
        case 'int':
          type = Type.int;
          break;
        case 'long':
          type = Type.long;
          break;
        case 'bool':
          type = Type.bool;
          break;
        case 'float':
          type = Type.float;
          break;
        case 'double':
          type = Type.double;
          break;
        default:
          continue; // Skip unrecognized types
      }

      // Add the variable with its type
      variables.add(MapEntry(type, varName));
    }

    return variables;
  }

  // Public method to process input text and return output text
  String generateMethods(String input) {
    List<MapEntry<Type, String>> variables = _parseInput(input);
    return _processInput(variables);
  }
}
