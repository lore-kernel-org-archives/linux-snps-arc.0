Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED26C43217
	for <linux-snps-arc@archiver.kernel.org>; Sun, 27 Nov 2022 18:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOp78ARDjhV8zFVVOIqMKxHQOIin3sfTTj9uN0a/pJU=; b=WJFewehzlOC2kt
	8zvKurBN0Ta97Ap3yTCCK3OIwxucgDlHbKx3RvlT8K4Lu9dRtN95/I88AVfRbAPJw3C/+NBL+Ck5v
	YSKL8Jk/BmWbqO+06iVnvYorKPFEjzu9M61gLYRh6jW+JEPrCWQmwJK1kDFXSaejBJvTdqwl465J6
	v5iOlehRrd0S53GKGpgBpKSmAwPfAjUdvsplDPVwKpPEPxUOGn03+gdoI9sL9MQdxkMUHuZAY9LES
	UwJ1aZusrqNDotzz/UNxJaH0I9xhYZKGRiOx3VbYPXlZ9iVEBOV0UyMjOWCRm+V2JbUgNtJ923V43
	uD/Qec1e2Yqizrh26DaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozMHx-00Cvqa-Gu; Sun, 27 Nov 2022 18:22:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozMHv-00Cvol-Dy
	for linux-snps-arc@lists.infradead.org; Sun, 27 Nov 2022 18:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669573316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Iw+UPNhCVZD+dFntoDtwn3gAtiN3+fQEkqEH/Zc4xE=;
	b=cM+d4JrXoejx1fEzfmSveZYOL0+vGx33XdwATCWa4MkA7zdgNOklguLZc8FaCs+LFI93wP
	GLCqoOjYXvOjca5MUu0RIoUAaGWcnAqrpz+woX2yDdB+V+nvQhOaHCNTX193yWgFehxae+
	RQTlg0XLB43qxKrEf1Ex24Tdl6Oiy2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-x1fpuE9BMdyWEV7kOtPQDQ-1; Sun, 27 Nov 2022 13:21:54 -0500
X-MC-Unique: x1fpuE9BMdyWEV7kOtPQDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8033E101A52A;
	Sun, 27 Nov 2022 18:21:54 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B00740C2087;
	Sun, 27 Nov 2022 18:21:53 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: libc-alpha@sourceware.org,  Claudiu Zissulescu
 <Claudiu.Zissulescu@synopsys.com>,  arcml
 <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] scripts: Add "|" operator support to glibcpp's
 parsing
References: <20221118131542.23188-1-shahab@synopsys.com>
	<20221127173825.3106-1-shahab@synopsys.com>
	<20221127173825.3106-2-shahab@synopsys.com>
Date: Sun, 27 Nov 2022 19:21:49 +0100
In-Reply-To: <20221127173825.3106-2-shahab@synopsys.com> (Shahab Vahedi's
	message of "Sun, 27 Nov 2022 18:38:24 +0100")
Message-ID: <87h6yk1cn6.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_102159_560222_D7342A5B 
X-CRM114-Status: GOOD (  10.46  )
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

* Shahab Vahedi:

> From the tests point of view, this is a necessary step for another
> patch [1] and allows parsing macros such as "#define A | B".  Without
> it, a few tests [2] choke when the other patch [1] is applied:
>
> /src/glibc/scripts/../elf/elf.h:4167: error: uninterpretable macro
> token sequence: ( EF_ARC_MACH_MSK | EF_ARC_OSABI_MSK )
> Traceback (most recent call last):
>     File "/src/glibc/elf/tst-glibcelf.py", line 23, in <module>
>       import glibcelf
>     File "/src/glibc/scripts/glibcelf.py", line 226, in <module>
>       _elf_h = _parse_elf_h()
>                ^^^^^^^^^^^^^^
>     File "/src/glibc/scripts/glibcelf.py", line 223, in _parse_elf_h
>       raise IOError('parse error in elf.h')
>   OSError: parse error in elf.h
>
> [1] ARC: update definitions in elf/elf.h
> https://sourceware.org/pipermail/libc-alpha/2022-November/143503.html
>
> [2]
> tst-glibcelf, tst-relro-ldso, and tst-relro-libc
>
> Signed-off-by: Shahab Vahedi <shahab@synopsys.com>

This okay and can go in separately, thanks.

Reviewed-by: Florian Weimer <fweimer@redhat.com>

Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
