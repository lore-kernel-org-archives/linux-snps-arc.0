From: tony.luck@intel.com (Luck, Tony)
Date: Mon, 12 Sep 2016 18:26:07 +0000
Subject: [PATCH v2 1/2] ia64: implement atomic64_dec_if_positive
In-Reply-To: <1473702432-8116-2-git-send-email-vgupta@synopsys.com>
References: <1473702432-8116-1-git-send-email-vgupta@synopsys.com>
 <1473702432-8116-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3908561D78D1C84285E8C5FCA982C28F3A1C7978@ORSMSX114.amr.corp.intel.com>
To: linux-snps-arc@lists.infradead.org

+static __inline__ long atomic64_dec_if_positive(atomic64_t *v)
+{
+	long c, old, dec;
+	c = atomic64_read(v);
+	for (;;) {
+		dec = c - 1;
+		if (unlikely(dec < 0))
+			break;
+		old = atomic64_cmpxchg((v), c, dec);
+		if (likely(old == c))
+			break;
+		c = old;
+	}
+	return dec;
+}

I was about to say "add a cpu_relax()" in the bottom of that loop. But none of the other
atomic ops that spin on a cmpxchg do that ... so:

Acked-by: Tony Luck <tony.luck at intel.com>

-Tony
