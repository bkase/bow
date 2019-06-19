import Bow

// MARK: Optics extensions
public extension Kind where F: Traverse {
    static var traversalK: Traversal<Kind<F, A>, A> {
        return KindTraversal<F, A>()
    }
}

public extension Kind where F: Foldable {
    static var foldK: Fold<Kind<F, A>, A> {
        return Fold<Kind<F, A>, A>.fromFoldable()
    }
}

private class KindTraversal<G: Traverse, A>: Traversal<Kind<G, A>, A> {
    override func modifyF<F: Applicative>(_ s: Kind<G, A>, _ f: @escaping (A) -> Kind<F, A>) -> Kind<F, Kind<G, A>> {
        return s.traverse(f)
    }
}
