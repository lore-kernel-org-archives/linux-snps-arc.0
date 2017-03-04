From: mpe@ellerman.id.au (Michael Ellerman)
Date: Sat, 04 Mar 2017 23:49:44 +1100
Subject: [PATCH 1/3] futex: remove duplicated code
In-Reply-To: <20170303122712.13353-1-jslaby@suse.cz>
References: <20170303122712.13353-1-jslaby@suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <877f45cil2.fsf@concordia.ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

Jiri Slaby <jslaby at suse.cz> writes:

> There is code duplicated over all architecture's headers for
> futex_atomic_op_inuser. Namely op decoding, access_ok check for uaddr,
> and comparison of the result.
>
> Remove this duplication and leave up to the arches only the needed
> assembly which is now in arch_futex_atomic_op_inuser.

Looks OK and boots on powerpc. But I don't think anything's actually
calling those futex ops. Is there a test suite I should run?

Acked-by: Michael Ellerman <mpe at ellerman.id.au> (powerpc)

cheers
