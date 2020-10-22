

# annotated log:

- version: `provider-v4.3.2`
- 作者: https://github.com/rrousselGit

## 依赖包: 

- https://github.com/rrousselGit/nested
- 也是该作者的另外一个包.


## 分析方式: 

- 根据示例代码, 由浅入深分析 provider 源码
- 示例入口: [example/lib/main.dart](example/lib/main.dart)
    - MultiProvider(): 
    
## modules:

### MultiProvider:

- 

### Provider:

- Provider:
    - lib/src/provider.dart:148
        - 基类: InheritedProvider():
            - [InheritedProvider](lib/src/inherited_provider.dart)


### ChangeNotifierProvider:

- lib/src/change_notifier_provider.dart




### InheritedProvider:

- lib/src/inherited_provider.dart
    - 基类: nested.dart#SingleChildStatelessWidget()


### DeferredInheritedProvider:

- lib/src/deferred_inherited_provider.dart



### StreamProvider:

- lib/src/async_provider.dart

### FutureProvider:

- lib/src/async_provider.dart


### ErrorBuilder:

- lib/src/async_provider.dart
