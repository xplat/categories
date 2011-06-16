{-# OPTIONS --universe-polymorphism #-}

open import Support hiding (⊥)
open import Category

module Category.Object.Initial {o ℓ e} (C : Category o ℓ e) where

open Category.Category C

record Initial : Set (o ⊔ ℓ ⊔ e) where
  field
    ⊥ : Obj
    ! : ∀ {A} → (⊥ ⇒ A)
    !-unique : ∀ {A} → (f : ⊥ ⇒ A) → ! ≡ f
 
  .⊥-id : (f : ⊥ ⇒ ⊥) → f ≡ id
  ⊥-id f = 
      begin
        f
      ≈⟨ sym (!-unique f) ⟩
        !
      ≈⟨ !-unique id ⟩
        id
      ∎
    where
    open IsEquivalence equiv
    open SetoidReasoning hom-setoid