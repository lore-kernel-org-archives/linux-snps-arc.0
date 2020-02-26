Return-Path: <SRS0=BbR1=4O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64C9C4BA21
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 19:27:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739A020732
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 19:27:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WttGffE4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="inOLwn3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 739A020732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJyO6hj/pC8GTTfzNtfOlAOXxz2S++tXkWObtGIGp38=; b=WttGffE4EgUjJd
	HhF8OcVupFwoJTzpALv8Z8qQTcgIKeFTqyNlDP+k7CNbQI774E7v98q6SC8Xb4nHGEMjEucIa6jfm
	ISATIc8YE5njd0dw7F9mNnRhPqxXNw5LKW8pYiokq5flJRr36ioHf9S0l24qDy2hz7gfKj6AUYoL4
	Ivr/ERe+QT7WGyx4VcjWL3HJOlSfcrLAiJwcITrBKSVEAYzrbERdLdKr023syCaHllf68hAqHU3Rv
	JfY+aA1SU37gPv3f/POua4ZRqP1Tb6i/aQ8BJEcXfbksE+gUHnSNoB58EyaRIeY2XS/AtkMyhGa4S
	JSdjS8ksaucZ7n/uU+pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j72LZ-0004tk-N9; Wed, 26 Feb 2020 19:27:53 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j72LW-0004sz-11
 for linux-snps-arc@lists.infradead.org; Wed, 26 Feb 2020 19:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582745267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBFtPQ6rc2THAuTmxU1tm8YLOzZZvg+ZIMeS5qOAQhQ=;
 b=inOLwn3n3wCH+PszFke5fAxQoq84Y9Z260ZhZWF058Tdp7FlYhH6eUbsKASaf4p4MAMgLZ
 tigUSMDXkQAb5csaFI5LsNCVc+lq+KEbQ1H70Uo7pePbcWb3QPYqW8BmPqkWedIuhhOhY2
 DuDMEEEJ+xyDNU4SEk4ZlwwnCzK0cwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-m43XfjvdMU6BnG7H8Lr9WA-1; Wed, 26 Feb 2020 14:27:39 -0500
X-MC-Unique: m43XfjvdMU6BnG7H8Lr9WA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 852B81005512;
 Wed, 26 Feb 2020 19:27:38 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-116-36.ams2.redhat.com
 [10.36.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C72525DA2C;
 Wed, 26 Feb 2020 19:27:36 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: ELF_INITFINI for ARC (was Re: [PATCH] Introduce <elf-initfini.h>
 and ELF_INITFINI for all architectures)
References: <87zhfngjot.fsf@oldenburg2.str.redhat.com>
 <mvm36b51ahf.fsf@suse.de> <871rqpfc07.fsf@oldenburg2.str.redhat.com>
 <mvmmu9dyyi8.fsf@suse.de> <87r1ypdrhj.fsf@oldenburg2.str.redhat.com>
 <cc69bcb6-526a-469d-f78a-035208645ae9@synopsys.com>
Date: Wed, 26 Feb 2020 20:27:34 +0100
In-Reply-To: <cc69bcb6-526a-469d-f78a-035208645ae9@synopsys.com> (Vineet
 Gupta's message of "Wed, 26 Feb 2020 19:10:16 +0000")
Message-ID: <87y2sp174p.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_112750_141147_26912749 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: Andreas Schwab <schwab@suse.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta:

> It seems that commit also removed init_array from
> sysdeps/{riscv,csky}/Implies - so newer arches. I suppose I need to do
> that for ARC as well - but could you please explain (or point to
> documentation) which explains how this the Implies stuff works.

You are very lucky.  The mechanism is explained in the section Porting
the GNU C Library in the manual:

  <https://www.gnu.org/software/libc/manual/html_node/Porting.html>

It's one of the few aspects of our build systems that's documented.

However, in commit f4349837d93b4dfe9ba09791e280ee2d6c99919f ("Introduce
<elf-initfini.h> and ELF_INITFINI for all architectures") I replaced the
use of the implies mechanism with a new header file, <elf-initfini.h>.
This allows us to control the default for new targets in a more explicit
way.  Previously, new ports had to include initarray explicitly, and we
know from past experience (the lack of removal of the sysctl function
comes to my mind) that this does not work.

>> But I'm no longer sure if RISC-V is actually an !ELF_INITFINI
>> architecture.
>
> And an arch is !ELF_INITFINI if it supports initarray ?

Not necessarily.  glibc always supports DT_INITARRAY for all targets,
but on some targets, it is necessary to honor DT_INIT/DT_FINI for legacy
binaries at least.  (I hope no targets are left where binutils produces
DT_INIT for regular ELF constructors, but I haven't checked.)

> I did switch ARC gcc [1] / binutils [2]to initarray last year
>
> [1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-January/005318.html
> [2] http://lists.infradead.org/pipermail/linux-snps-arc/2019-February/005388.html

I haven't followed the ARC contribution process closely, sorry.  Do you
plan to contribute the port with a GLIBC_2.32 ABI baseline, or do you
want to support older binaries for an earlier non-upstream port,
backdating the baseline?

This matters because in the GLIBC_2.32 case, old binaries will not work
anyway, so we may as well require that they are rebuilt without
DT_INIT/DT_FINI.  In this case, the glibc master defaults should work.

If you want to support old binaries (which use older symbol versions
such as GLIBC_2.17), it may make sense to keep DT_INIT/DT_FINI support
as well.  To achieve this, you need to add an <elf-initifini.h> header
file with

/* Enable DT_INIT/DT_FINI support.  */
#define ELF_INITFINI 1

and keep the crti.S and crtn.S files you already have.

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
