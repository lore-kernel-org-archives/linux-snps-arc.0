Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8ACC43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 22:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A21C02071B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 22:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A5orEPAC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A21C02071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUwthGL99V+NUMLwP/pa9n/Bijx/rfZcRk+HUDnOiZ8=; b=A5orEPACRUQNqL
	CG5fASXuNCuBkTEgBlCDSkSIcV9t/SAxTK8iFY5aQ1DoF0R+vhYAv+WoYXCJNW/waCN4m825yVuS4
	C8DqvckIu2fmeAouS2GIqDzCKkL01K0AMlIL8tQJqD5/PySaDogXAeUmyK1r0n8aLG7iLLMhaJyD/
	/PmWDyCT0AUoq7HOSI19m+EzObqQSw9x2WQm1Ns04nNV7YzpcG3+NCjA97nQeyMxqglDV5akTklna
	b9ItbrtpO69I0Fi4vlw/KRGzYIG9O96nfycNEXNZQroiLnVapOxEp/ucARs95EeUwva+Wid6vJE1J
	UryRDnaAEwATLb4WxwEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHxl9-0006FO-2A; Fri, 27 Mar 2020 22:47:27 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHxl6-0006F7-05
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 22:47:26 +0000
IronPort-SDR: AFmr9t2qR09yHjkwGrdjchuAbJc7reZWmjNTRGrPK6rYh8QbfRCDaPFjbxY9WLC2j2ESamHA4b
 aBDw8ynmZKNpkjh/N9KMyLjsIGjlCy8rJGkR3AxO8w8HHhzWn3fhMkl/E3j3o886a5dEZdm8QP
 IBm3+PxxlADijWTU+r6ZYWIeJNVW3YV/ubzFlsn/K3PENxArA+pXZUD/b8QROFW3RhG5YOOxsR
 4A9g8T1FqL1DvrRgQMRGWWuQYia5ioyT7LLV+1xVx+nwmjtfdSk5WpzwA9BTK923sQJpXaHX/F
 iOo=
X-IronPort-AV: E=Sophos;i="5.72,314,1580803200"; d="scan'208";a="47244711"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 27 Mar 2020 14:47:22 -0800
IronPort-SDR: ZLQcOYmjsHWUbjDOU7IhJh+qDx8h/rlvE7GYKQjh78jJXiAKFmhJceM9SfL77wc/GCMuWCLhqw
 p0apI86vYtslmnQLTN2RqIzU4o8yXurew6LNmAs9lY+XorkFrhA8OArcLHuvQ8MjFpeYT5lhc0
 BMrbJTeES2yw8/LBFehCjFwLKQjeJ5tLX2xxDh6rO3aAv0I+sipj8rwf/q5I3jqjuopr1M2Hjs
 1lZUFCvxOwmOMwZpXebKQ93ic0jUw1dhwbqluCSF7nM9rqz/VgaO3dcukd4xJxBZ2/yoM09P+/
 ZZs=
Date: Fri, 27 Mar 2020 22:47:16 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 13/15] ARC: Build Infrastructure
In-Reply-To: <20200313030419.15843-14-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_154724_073624_E85CBC7D 
X-CRM114-Status: UNSURE (   6.20  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> +ifeq ($(subdir),debug)
> +CFLAGS-backtrace.c += -funwind-tables
> +endif

debug/Makefile already has

CFLAGS-backtrace.c += -fno-omit-frame-pointer -funwind-tables

so you shouldn't need this.

> +++ b/sysdeps/arc/Versions
> @@ -0,0 +1,6 @@
> +libc {
> +  GLIBC_2.32 {
> +    __syscall_error;

Why does __syscall_error need a public symbol version?  If it's used by a 
library other than libc, that means it needs to be exported at some symbol 
version - but it only needs a public version (as opposed to GLIBC_PRIVATE) 
if it might be used by user programs linked with glibc (if it's used in 
crt*.o, lib*_nonshared.a, or inline functions in installed headers, for 
example - or in libgcc.a, libstdc++.a, etc. (GCC static libraries)).

> +  gccfloat=`$CC $CFLAGS $CPPFLAGS -E -dM -xc /dev/null | grep __ARC_FPU_| wc -l`
> +  if test "$gccfloat" != "0"; then
> +    echo "glibc being configured for double precision floating point"

preconfigure fragments should not print this sort of debugging message 
with "echo".  If you feel such a message is important, use preconfigure.ac 
and print it with AC_MSG_NOTICE.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
