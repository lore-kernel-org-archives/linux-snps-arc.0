Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F19C4332F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfLgEm3T9F5SAZWaMhy2GyY/rRIVFLZ+cZ40GBhpGgo=; b=x+m+onqX2cvjeN
	ghquyyTPKEAXTe3rxXC8K4oJH6sGm7JOfVZusxqR/LeBJ+POrr0V2zg9IQj08fkPYGwOt+rY4pGBG
	8A5Lm0pDbUnH6GKvLNnwuVOLZEZraXP2+p/FQoetB2w9yjCCwfRF2yYMAy2izaDf49cGgeQBBKwz3
	sPmfSBL75+eaNpbC3LHz2vgt3a85ZS6j1L8OW9KZjtrwlFfpv+ZBRedCh/RovUDDZT8CFv4s9B4ZH
	SAiSFWI4KE2QtrkLxe2JFNYm4jX3Ro9YKnOPlIu1Il4zFTMOVzhTH1vppHXWmpb3FaU/Uz8bsaHQl
	fsblPXug7WvzZ07svPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVnN-009nip-Aq; Tue, 22 Feb 2022 14:05:37 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVnI-009nfy-09
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:05:35 +0000
Received: by mail-lf1-x12a.google.com with SMTP id w27so7268338lfa.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vbnwpg1DeB6lMA8lLwJgO4TFedLU074GT3ZjzBkUEWs=;
 b=dR2POuHDJ37Y/MozgopcEi+t+YTy27CdzIl/VKN1hrQADuxDwZ00cj7vFMC9TIBlpH
 Xboyml+cOypjn4aFnGk0IkTG1zubt6Nw9Zxq/v9CI1/sbjCUYqHv5OaQWRQskYhVydWf
 jDfA05kag69gqeuCQ21bH6EayIISgLlg0dq8SINlVRG2zfd5L8QMkVsYJT12ea8/6qTb
 HcYjiwkB+RAy7yPgvUpwtFYrtM65Ge3WWKdmEdH8mOde0qp5qgZtL1tcphV53lALT/oS
 RY7b45pdkzTA3U96GTUf0ko/KIERk+d7pBOnwD4oNfLLiicHhQ3wTgeSX6kLRAV96HT/
 c17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vbnwpg1DeB6lMA8lLwJgO4TFedLU074GT3ZjzBkUEWs=;
 b=FZ7055BZk/JwbVpt25heu/9v2kLLAbJSH7Mz1H+Ox/ynf0ApR8E/pvZ3HtgTUUR0HU
 rnmNZuVUxkqQ1CcUtGVZTVXoD4g6TnUjp3vD3aqvMtMN274EQkJnLEH0ZuALXP2HD2nn
 3xO6YtwB+svzA7OYcYLoSPqdEJuASfq000ceMbqgcLV1Dwn+vkRKmSojgDXm+CB9RaMY
 BMEMK09DT+0/wBYaWczdj3FvbZtjuOfimLPCgQma20/QNbZBn0H9fhbh07yLh0Nw2Hy6
 V87XgkSbjAcsLhRAypPGKtMvOn28x/WHwGTVIEDuAWm5Sc+c0PqlnfndKcAi2LLW0K9x
 ksAw==
X-Gm-Message-State: AOAM532z9UZpfCODmjL6H2ppDyZSQQ0wn59cpauRP6LKYsIsJjmMTAfy
 Jh6N4i4A7enfyd+CW2qtxG+jJ7D0RAs=
X-Google-Smtp-Source: ABdhPJz5amW8dNQp/KIly9XvKE1R3uqNRGVC+pxmOaEDJSe3oPywkBYsgtYKwXOWXCQFfYsO9722pA==
X-Received: by 2002:ac2:5186:0:b0:443:8db1:1a17 with SMTP id
 u6-20020ac25186000000b004438db11a17mr16911723lfi.434.1645538729919; 
 Tue, 22 Feb 2022 06:05:29 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id a19sm512003ljq.80.2022.02.22.06.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:05:29 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH 2/2] ARC: atomic: avoid unwanted gcc optimizations in atomic
 operations
Date: Tue, 22 Feb 2022 17:05:25 +0300
Message-Id: <20220222140525.4002518-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222140525.4002518-1-geomatsi@gmail.com>
References: <20220222140525.4002518-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_060532_095115_BC29124C 
X-CRM114-Status: GOOD (  14.29  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

All the llock/scond based atomic operations read and write atomic counter
field. However write operation performed by the scond instruction is not
properly communicated to the compiler: inline assembly shows atomic
argument as an input parameter and its clobber list does not include
'memory'. As a result, compiler can optimize the usage of atomic argument.
This issue can be observed with the following simple test functions:

static void test_atomic_simple(void)
{
        int v0 = 0xfaceabab;
        atomic_t v;
        int r;

        atomic_set(&v, v0);
        r = v0;

        atomic_inc(&v);
        r += 1;
        BUG_ON(v.counter != r);
}

static void test_atomic_simple64(void)
{
        long long v0 = 0xfaceabadf00df001LL;
        atomic64_t v;
        long long r;

        atomic64_set(&v, v0);
        r = v0;

        atomic64_inc(&v);
        r += 1LL;
        BUG_ON(v.counter != r);
}

This commit fixes unwanted optimizations notifying compiler about write
operations. For this purpose atomic argument is moved to the output list.
Besides "memory" is added to the list of clobber arguments unless it is
explicitly clarified by the comment why it is not needed. Finally,
appropriate memory constraint 'ATO' is set for atomic ops arguments.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 arch/arc/include/asm/atomic-llsc.h    | 36 ++++++++---------
 arch/arc/include/asm/atomic64-arcv2.h | 58 +++++++++++++--------------
 2 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/arch/arc/include/asm/atomic-llsc.h b/arch/arc/include/asm/atomic-llsc.h
index 1b0ffaeee16d..b6cbc3ea1f52 100644
--- a/arch/arc/include/asm/atomic-llsc.h
+++ b/arch/arc/include/asm/atomic-llsc.h
@@ -11,14 +11,14 @@ static inline void arch_atomic_##op(int i, atomic_t *v)			\
 	unsigned int val;						\
 									\
 	__asm__ __volatile__(						\
-	"1:	llock   %[val], [%[ctr]]		\n"		\
+	"1:	llock   %[val], %[ctr]			\n"		\
 	"	" #asm_op " %[val], %[val], %[i]	\n"		\
-	"	scond   %[val], [%[ctr]]		\n"		\
+	"	scond   %[val], %[ctr]			\n"		\
 	"	bnz     1b				\n"		\
-	: [val]	"=&r"	(val) /* Early clobber to prevent reg reuse */	\
-	: [ctr]	"r"	(&v->counter), /* Not "m": llock only supports reg direct addr mode */	\
-	  [i]	"ir"	(i)						\
-	: "cc");							\
+	: [val]	"=&r"	(val), /* Early clobber to prevent reg reuse */	\
+	  [ctr] "+ATO" (v->counter)				\
+	: [i]	"ir"	(i)						\
+	: "cc", "memory");						\
 }									\
 
 #define ATOMIC_OP_RETURN(op, asm_op)				\
@@ -27,14 +27,14 @@ static inline int arch_atomic_##op##_return_relaxed(int i, atomic_t *v)	\
 	unsigned int val;						\
 									\
 	__asm__ __volatile__(						\
-	"1:	llock   %[val], [%[ctr]]		\n"		\
+	"1:	llock   %[val], %[ctr]			\n"		\
 	"	" #asm_op " %[val], %[val], %[i]	\n"		\
-	"	scond   %[val], [%[ctr]]		\n"		\
+	"	scond   %[val], %[ctr]			\n"		\
 	"	bnz     1b				\n"		\
-	: [val]	"=&r"	(val)						\
-	: [ctr]	"r"	(&v->counter),					\
-	  [i]	"ir"	(i)						\
-	: "cc");							\
+	: [val]	"=&r"	(val),						\
+	  [ctr] "+ATO" (v->counter)				\
+	: [i]	"ir"	(i)						\
+	: "cc", "memory");						\
 									\
 	return val;							\
 }
@@ -48,15 +48,15 @@ static inline int arch_atomic_fetch_##op##_relaxed(int i, atomic_t *v)	\
 	unsigned int val, orig;						\
 									\
 	__asm__ __volatile__(						\
-	"1:	llock   %[orig], [%[ctr]]		\n"		\
+	"1:	llock   %[orig], %[ctr]			\n"		\
 	"	" #asm_op " %[val], %[orig], %[i]	\n"		\
-	"	scond   %[val], [%[ctr]]		\n"		\
+	"	scond   %[val], %[ctr]			\n"		\
 	"	bnz     1b				\n"		\
 	: [val]	"=&r"	(val),						\
-	  [orig] "=&r" (orig)						\
-	: [ctr]	"r"	(&v->counter),					\
-	  [i]	"ir"	(i)						\
-	: "cc");							\
+	  [orig] "=&r" (orig),						\
+	  [ctr] "+ATO" (v->counter)				\
+	: [i]	"ir"	(i)						\
+	: "cc", "memory");						\
 									\
 	return orig;							\
 }
diff --git a/arch/arc/include/asm/atomic64-arcv2.h b/arch/arc/include/asm/atomic64-arcv2.h
index c5a8010fdc97..ea9b5d41b645 100644
--- a/arch/arc/include/asm/atomic64-arcv2.h
+++ b/arch/arc/include/asm/atomic64-arcv2.h
@@ -53,14 +53,14 @@ static inline void arch_atomic64_##op(s64 a, atomic64_t *v)		\
 									\
 	__asm__ __volatile__(						\
 	"1:				\n"				\
-	"	llockd  %0, [%1]	\n"				\
+	"	llockd  %0, %1		\n"				\
 	"	" #op1 " %L0, %L0, %L2	\n"				\
 	"	" #op2 " %H0, %H0, %H2	\n"				\
-	"	scondd   %0, [%1]	\n"				\
+	"	scondd   %0, %1		\n"				\
 	"	bnz     1b		\n"				\
-	: "=&r"(val)							\
-	: "r"(&v->counter), "ir"(a)					\
-	: "cc");							\
+	: "=&r"(val), "+ATO"(v->counter)					\
+	: "ir"(a)							\
+	: "cc", "memory");						\
 }									\
 
 #define ATOMIC64_OP_RETURN(op, op1, op2)		        	\
@@ -70,13 +70,13 @@ static inline s64 arch_atomic64_##op##_return_relaxed(s64 a, atomic64_t *v)	\
 									\
 	__asm__ __volatile__(						\
 	"1:				\n"				\
-	"	llockd   %0, [%1]	\n"				\
+	"	llockd   %0, %1		\n"				\
 	"	" #op1 " %L0, %L0, %L2	\n"				\
 	"	" #op2 " %H0, %H0, %H2	\n"				\
-	"	scondd   %0, [%1]	\n"				\
+	"	scondd   %0, %1		\n"				\
 	"	bnz     1b		\n"				\
-	: [val] "=&r"(val)						\
-	: "r"(&v->counter), "ir"(a)					\
+	: "=&r"(val), "+ATO"(v->counter)					\
+	: "ir"(a)							\
 	: "cc");	/* memory clobber comes from smp_mb() */	\
 									\
 	return val;							\
@@ -92,13 +92,13 @@ static inline s64 arch_atomic64_fetch_##op##_relaxed(s64 a, atomic64_t *v)	\
 									\
 	__asm__ __volatile__(						\
 	"1:				\n"				\
-	"	llockd   %0, [%2]	\n"				\
+	"	llockd   %0, %2		\n"				\
 	"	" #op1 " %L1, %L0, %L3	\n"				\
 	"	" #op2 " %H1, %H0, %H3	\n"				\
-	"	scondd   %1, [%2]	\n"				\
+	"	scondd   %1, %2		\n"				\
 	"	bnz     1b		\n"				\
-	: "=&r"(orig), "=&r"(val)					\
-	: "r"(&v->counter), "ir"(a)					\
+	: "=&r"(orig), "=&r"(val), "+ATO"(v->counter)			\
+	: "ir"(a)							\
 	: "cc");	/* memory clobber comes from smp_mb() */	\
 									\
 	return orig;							\
@@ -145,14 +145,14 @@ arch_atomic64_cmpxchg(atomic64_t *ptr, s64 expected, s64 new)
 	smp_mb();
 
 	__asm__ __volatile__(
-	"1:	llockd  %0, [%1]	\n"
+	"1:	llockd  %0, %1		\n"
 	"	brne    %L0, %L2, 2f	\n"
 	"	brne    %H0, %H2, 2f	\n"
-	"	scondd  %3, [%1]	\n"
+	"	scondd  %3, %1		\n"
 	"	bnz     1b		\n"
 	"2:				\n"
-	: "=&r"(prev)
-	: "r"(ptr), "ir"(expected), "r"(new)
+	: "=&r"(prev), "+ATO"(*ptr)
+	: "ir"(expected), "r"(new)
 	: "cc");	/* memory clobber comes from smp_mb() */
 
 	smp_mb();
@@ -167,12 +167,12 @@ static inline s64 arch_atomic64_xchg(atomic64_t *ptr, s64 new)
 	smp_mb();
 
 	__asm__ __volatile__(
-	"1:	llockd  %0, [%1]	\n"
-	"	scondd  %2, [%1]	\n"
+	"1:	llockd  %0, %1		\n"
+	"	scondd  %2, %1		\n"
 	"	bnz     1b		\n"
 	"2:				\n"
-	: "=&r"(prev)
-	: "r"(ptr), "r"(new)
+	: "=&r"(prev), "+ATO"(*ptr)
+	: "r"(new)
 	: "cc");	/* memory clobber comes from smp_mb() */
 
 	smp_mb();
@@ -195,15 +195,15 @@ static inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
 	smp_mb();
 
 	__asm__ __volatile__(
-	"1:	llockd  %0, [%1]	\n"
+	"1:	llockd  %0, %1		\n"
 	"	sub.f   %L0, %L0, 1	# w0 - 1, set C on borrow\n"
 	"	sub.c   %H0, %H0, 1	# if C set, w1 - 1\n"
 	"	brlt    %H0, 0, 2f	\n"
-	"	scondd  %0, [%1]	\n"
+	"	scondd  %0, %1		\n"
 	"	bnz     1b		\n"
 	"2:				\n"
-	: "=&r"(val)
-	: "r"(&v->counter)
+	: "=&r"(val), "+ATO"(v->counter)
+	:
 	: "cc");	/* memory clobber comes from smp_mb() */
 
 	smp_mb();
@@ -228,17 +228,17 @@ static inline s64 arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
 	smp_mb();
 
 	__asm__ __volatile__(
-	"1:	llockd  %0, [%2]	\n"
+	"1:	llockd  %0, %2		\n"
 	"	brne	%L0, %L4, 2f	# continue to add since v != u \n"
 	"	breq.d	%H0, %H4, 3f	# return since v == u \n"
 	"2:				\n"
 	"	add.f   %L1, %L0, %L3	\n"
 	"	adc     %H1, %H0, %H3	\n"
-	"	scondd  %1, [%2]	\n"
+	"	scondd  %1, %2		\n"
 	"	bnz     1b		\n"
 	"3:				\n"
-	: "=&r"(old), "=&r" (temp)
-	: "r"(&v->counter), "r"(a), "r"(u)
+	: "=&r"(old), "=&r" (temp), "+ATO"(v->counter)
+	: "r"(a), "r"(u)
 	: "cc");	/* memory clobber comes from smp_mb() */
 
 	smp_mb();
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
