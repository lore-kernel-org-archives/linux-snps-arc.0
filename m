From: elfring@users.sourceforge.net (SF Markus Elfring)
Date: Fri, 12 Oct 2018 20:51:45 +0200
Subject: [PATCH v2 1/2] treewide: remove unused address argument from
 pte_alloc functions
In-Reply-To: <20181012013756.11285-1-joel@joelfernandes.org>
References: <20181012013756.11285-1-joel@joelfernandes.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <03b524f3-5f3a-baa0-2254-9c588103d2d6@users.sourceforge.net>
To: linux-snps-arc@lists.infradead.org

> The changes were obtained by applying the following Coccinelle script.

A bit of clarification happened for its implementation details.
https://systeme.lip6.fr/pipermail/cocci/2018-October/005374.html

I have taken also another look at the following SmPL code.


> identifier fn =~
> "^(__pte_alloc|pte_alloc_one|pte_alloc|__pte_alloc_kernel|pte_alloc_one_kernel)$";

I suggest to adjust the regular expression for this constraint
and in subsequent SmPL rules.

"^(?:pte_alloc(?:_one(?:_kernel)?)?|__pte_alloc(?:_kernel)?)$";


> (
> - T3 fn(T1 E1, T2 E2);
> + T3 fn(T1 E1);
> |
> - T3 fn(T1 E1, T2 E2, T4 E4);
> + T3 fn(T1 E1, T2 E2);
> )

I propose to take an other SmPL disjunction into account here.

 T3 fn(T1 E1,
(
-      T2 E2
|      T2 E2,
-      T4 E4
)      );


> (
> - #define fn(a, b, c)@p e
> + #define fn(a, b) e
> |
> - #define fn(a, b)@p e
> + #define fn(a) e
> )

How do you think about to omit the metavariable ?position p? here?

Regards,
Markus
