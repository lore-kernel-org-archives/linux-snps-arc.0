Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7153DC33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:09:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4925724658
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GhLfZCIn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fm/TVH0m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4925724658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AMhlyhgqVralGzkbmG7B6pA4SFxTZCybVRm5jHmtJ+M=; b=GhLfZCInhkejng
	OXp15zQb1WobLB7LvMa+x0RysAN7uh15sPlilk96oEdO6emxSWJyLLtLGMMEHHfDo052oa9Fa61UR
	WJn5TLzWrgWki0X5Pm57BlhhyN/mq72EidimbmY5OzojgOHPTZMjiB6LsirInFJXGOQNfvLvN6Dnz
	nqH6pz6uUQUDtWLf6xe10rd+kzpBvfR9O7y2/byycma2sIyUX6tWNI2tY3VekiGEK7Ubb89TXyjTV
	hFB38e1qJMT/EVtrlKTGqqVFDz3CxEqqfmE3cvsXwG0H6iR+0i6SjLqx+2pLpzS47C72ahkKuipg+
	K5z2S0UH3hI2EDjBEHwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irSUm-0003Vs-3u; Tue, 14 Jan 2020 20:09:00 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irSUj-0003Ua-7N
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 20:08:58 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C556C4049B;
 Tue, 14 Jan 2020 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579032536; bh=f5GlxhH1g7W0d3zEgvx81jnLwcqIiTTmh3wCeGRzGW0=;
 h=From:To:Cc:Subject:Date:From;
 b=fm/TVH0mNkG5VblJWaqvz2mdAEeXboKh6uXtqrQv8g6K4lppyWbpONWze6HfTGsuk
 D2nlY9m6Pj5TuT/CDkL/5sqZREDt6Zglbeh2zl2SeWZnT2t8hTzfTfGOBNL6qjn2ze
 l+6kT7uCoaj6sPfP0fVQF0cAeyMFvxfLBseZ3fZnwnYBiRxvXI19qO5Z2DoBJKZnwh
 OXJ0kTUQXr9X/Q6zhLzEm7kiJ+wGcLkYjxUHfkIx8UvjwO7rnNCDjoGqDi9kudoPcV
 4I1HXDCoIfP3aTmCGr+u+jl1aLHOa6jxn1p9w8TUZ6nT7hprCvrRNupN9xnlctaqnw
 IHOf0LtcpCi1A==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.25])
 by mailhost.synopsys.com (Postfix) with ESMTP id 88973A0096;
 Tue, 14 Jan 2020 20:08:51 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@arndb.de>, Khalid Aziz <khalid.aziz@oracle.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>,
 Aleksa Sarai <cyphar@cyphar.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC 0/4] Switching ARC to optimized generic strncpy_from_user
Date: Tue, 14 Jan 2020 12:08:42 -0800
Message-Id: <20200114200846.29434-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_120857_307693_4461E116 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

This came up when trying to move ARC over to generic word-at-a-time
interface.

 - 1/4 is a trivial fix (and needed for ARC switch)
 - 2/4 is mucking with internals hence the RFC. I could very likely be
   overlooking some possible DoS / exploit issues and apologies in advance
   if thats the case but I felt like sharing it anyways to see what
   others think.
 - 3/4, 4/4 are ARC changes to remove the existing ARC version and
   switch to generic (needs 1/4).

Thx,
-Vineet

Vineet Gupta (4):
  asm-generic/uaccess: don't define inline functions if noinline lib/*
    in use
  lib/strncpy_from_user: Remove redundant user space pointer range check
  ARC: uaccess: remove noinline variants of __strncpy_from_user() and
    friends
  ARC: uaccess: use optimized generic __strnlen_user/__strncpy_from_user

 arch/arc/Kconfig                      |  2 +
 arch/arc/include/asm/Kbuild           |  1 -
 arch/arc/include/asm/uaccess.h        | 87 ++-------------------------
 arch/arc/include/asm/word-at-a-time.h | 49 +++++++++++++++
 arch/arc/mm/extable.c                 | 23 -------
 include/asm-generic/uaccess.h         |  4 ++
 lib/strncpy_from_user.c               | 36 ++++-------
 lib/strnlen_user.c                    | 28 +++------
 8 files changed, 79 insertions(+), 151 deletions(-)
 create mode 100644 arch/arc/include/asm/word-at-a-time.h

-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
