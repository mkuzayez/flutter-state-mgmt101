# state_mgmt_101

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Riverpod Basics: To Be Continued


ref.read(): one time read of the value of/in the provider.
ref.watch(): get the value of/in the provider everytime the value changes (you get notified any time there's a change).
ref.listen(): similar to watch, the main difference is the return type, watch() returns the new value directly,
while listen returns a void but gives access to the new and the old value.

- ProviderScope:
Creates a ProviderContainer under the hood, which is used to hold the state of the providers

Creating a simple Provider:
final helloWorldProvider = Provider<String>((ref) => return "Hello world");

1- helloworldProvider: global variable that we use to read the state of provider.
2- Provider<String>: decleration of the type of the Provider we using, and the type of the state it's holding
3- ref() =>: a function that creates the state. ref is a parameter used to read the state (e.g. ref.watch(helloworldProvider);).

- ConsumerWidget Class:
Used instead of StatelessWidget in order to get access to ref by accepting it as an argument beside Buildcontext context

- Consumer Class:
it's possible, to wrap a specific widget you need to access ref in with a Consumer() builder, instead of using ConsumerWidget. 
More verbose, yet more efficent if you have a big and complex widget, because you only rebuild the part where you wrap your code not the entire widget.

- ConsumerStatefull Class
it's a replacment of the StatefullWidget, in case you need at access ref. 

- WidgetRef: WidgetRef as an object that allows widgets to interact with providers.
Buildcontext and WidgetRef are simillar: BuildContext let us access ancestor widgets such as MediaQuery.of(context) the same way WidgetRef let us access any provider inside our app,
because providers are by design global values.

TYPES of Providers:

1- Provider: a great kind of providers for accessing objects that's immutable
2- StateProvider [Legacy]: used for storing simple data that could change, such as a counter.
3- StateNotifier [Legacy]: used for storing more complex data that could change, such as maps, widgets, and other objects
'''Combined with [StateNotifier], [StateNotifierProvider] can be used to manipulate advanced states, 
that would otherwise be difficult to represent with simpler providers such as [Provider] or [FutureProvider].'''

if you ref.watch() the provider inside the build method, it will trigger a rebuild every time it changes. also, you can update the state value by using ref.read(provider.notifier)
.notifier will allow you apply methods to the state.
