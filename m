Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D3EC38BE2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 19:13:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77922084E
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 19:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r1zOwq5+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZLrrypx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77922084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJnkTZWh7lX5DBD9otC0N1IznMEEFaaC9HonD+thfe8=; b=r1zOwq5+15L8SX
	J6z9HHd/t22RoQyVJOZP5FujtHDKcaKBRk62sXQ6DIigC1wV9q7CXc1fHuEpFOjYGAw1dnoFTVx0D
	AOE6o+DMwbJfMo/7ckGUXw1RKJ/STeTxLSTwNO0YJVroaIV16dmQjXRSZqCt1NPFS8oL7hPjhkqNh
	MGPQwGBIzl+ZGjWNlbGLw90QpA0IQDZPaGjl/1PX1992S7uRD5jy2DWH35HUw1zsoZeLmnTn8DLFg
	wdLl0ZcATle0xVqhfcB5/fRc6ejxJ0swIFFatJGIBVvH0CL1kbtTr1GdXYLfQ7vN1yUeVj6SWd3DE
	qiRXSG2TAywg18uQ4Vkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6JAs-0001zC-Ut; Mon, 24 Feb 2020 19:13:50 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6JAH-0001L9-F7
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 19:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582571589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlZXTskLf66nYnRWbv4UfTwilvRJkNdjLzNMFI73VZ8=;
 b=AZLrrypxDEO/4hRr+1/wgQZJ/6EVo8fw7G6IXPX/jfhehbt6AAl8lO+5BlZgR80iEHGU+z
 5mYz5w27WSWGVUKhB7ynvh3CdGrt/Jn4DD6kdLduUk/qoe5EZD93Ej9x84Oq5EOW390MxM
 qTm/0Jxeb4ijXcVWYBfGMi+QA/eRSdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-dzu_AfQFP2q0PUWlAxIXxQ-1; Mon, 24 Feb 2020 14:13:07 -0500
X-MC-Unique: dzu_AfQFP2q0PUWlAxIXxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EF7B14737;
 Mon, 24 Feb 2020 19:13:05 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-116-104.ams2.redhat.com
 [10.36.116.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC9CD5D9CD;
 Mon, 24 Feb 2020 19:13:02 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] asm-generic ABI: Allow statx syscall despite fstatat64,
 fstat64
References: <20200224182305.28027-1-vgupta@synopsys.com>
 <87wo8bn839.fsf@oldenburg2.str.redhat.com>
 <d56495ad-c532-9e00-7f67-fa2626f9d901@synopsys.com>
Date: Mon, 24 Feb 2020 20:13:01 +0100
In-Reply-To: <d56495ad-c532-9e00-7f67-fa2626f9d901@synopsys.com> (Vineet
 Gupta's message of "Mon, 24 Feb 2020 19:03:03 +0000")
Message-ID: <87d0a3n6iq.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_111313_594074_CEB87F1B 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "lukma@denx.de" <lukma@denx.de>, "arnd@arndb.de" <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta:

> On 2/24/20 10:39 AM, Florian Weimer wrote:
>>> +# undef STAT64_IS_NOT_KERNEL_STAT64
>>
>> Sorry, I think that going forward, we prefer that such macros are always
>> defined, with values 0 or 1 as appropriate.
>
> And that means we also need to additionally define this to 0 in all
> ports which don't end up including the generic header ?

Yes, or move the definition into its own header, with the default for
*future* architectures (not the majority of the current architectures)
in the header in the sysdeps/unix/sysv/linux directory.

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
