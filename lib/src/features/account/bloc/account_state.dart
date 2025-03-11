part of 'account_bloc.dart';

final class AccountState extends Equatable {
  const AccountState({required this.user});

  final MUser user;

  @override
  List<Object> get props => [user];

  bool get isLogin => user.id.isNotEmpty; // && token.isNotEmpty

  AccountState copyWith({MUser? user}) {
    return AccountState(user: user ?? this.user);
  }

  factory AccountState.ds() {
    return AccountState(user: UserPrefs.I.getUser() ?? MUser.empty());
  }

  AccountState login(MUser user) {
    return copyWith(user: user);
  }

  AccountState logout() {
    return copyWith(user: MUser.empty());
  }
}

extension AccountStateX on AccountState {
  bool isProductFavorite(String productId) {
    return user.favorites.contains(productId);
  }
}
