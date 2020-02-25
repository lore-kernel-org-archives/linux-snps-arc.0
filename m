Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAA3C35DF9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 09:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD9221556
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 09:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xn+wxl/d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cFFoZ89y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD9221556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zpTfE61Om34UP/eHsSnEfujOkh9p45miblb0vKdCDg=; b=Xn+wxl/dUvaLEl
	ZYNXawQq7rzehPRXopxRF22hCKe7JQQegu+Z/KkZ2JhlhCehdU8BUnxQYZpN9xkLQtG0FmL+AtgaT
	Un/I+U8EvdBZtvQG7trs6ldjIeB41IyOwH+yBvpDhyvao+ZH6WSsqtBg6ox0PsuOowbUTiLgJ38cB
	mJF3a3i6kWZV9ZvWyixmfiXuykY6uMYUM/RpdKRnxcHFzwpuxAVKxrjM1TGqYt+ygpHLnA2GeAwNE
	ooAFlOySXLPShCDjqShrAMrGxU3d+hNCCrx8nGtvdKf0jFqBEsag8mDslSWemeB+9tcF65Klh7t2r
	FSGUi/+vS8ZeA5p3fGIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6WVe-0001Dx-IZ; Tue, 25 Feb 2020 09:28:10 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6WVb-0001DF-Ua
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 09:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582622884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AO6SGyEe+YNvpCDly/8OqBAM2ksSyffP+AJ06ZpZaR8=;
 b=cFFoZ89yxD3KThVjDejSns5WwdEHG5AY6dN6y9p4eft8t7aeF6Yga4JnVwzDyFBMfvmfmp
 0xIDTLewG5pKK5/3DRX0BAan8sHkxdotPZABfEw0xrGc+SUrKxSsXYbnZ3kiLumjBHDRSo
 81A87qXHEJ0U9xeOkjxqKhEGGk521B8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-D1usrYaKNB23gM_0erJupA-1; Tue, 25 Feb 2020 04:27:59 -0500
X-MC-Unique: D1usrYaKNB23gM_0erJupA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CB5118A5505;
 Tue, 25 Feb 2020 09:27:58 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-116-104.ams2.redhat.com
 [10.36.116.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AC545C1D6;
 Tue, 25 Feb 2020 09:27:55 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] Force 64-bit time based syscalls for TIMESIZE==64 on
 32-bit arches
References: <20200224183413.13629-1-vgupta@synopsys.com>
Date: Tue, 25 Feb 2020 10:27:54 +0100
In-Reply-To: <20200224183413.13629-1-vgupta@synopsys.com> (Vineet Gupta's
 message of "Mon, 24 Feb 2020 10:34:13 -0800")
Message-ID: <87r1yjhv8l.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_012808_066054_F807F85F 
X-CRM114-Status: UNSURE (   9.17  )
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
Cc: alistair23@gmail.com, linux-snps-arc@lists.infradead.org,
 libc-alpha@sourceware.org, lukma@denx.de, arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta:

> +/* Override syscalls for asm-generic ABIs with 64-bit time.  */
> +#if __WORDSIZE == 32 && __TIMESIZE == 64
> +
> +# undef __NR_futex
> +# define __NR_futex __NR_futex_time64
> +
> +# undef __NR_rt_sigtimedwait
> +# define __NR_rt_sigtimedwait __NR_rt_sigtimedwait_time64

I'm not totally unsympathetic to this in principle, but I think if we
start messing more with the system call numbers in this way, we should
move away from the __NR_ prefixes and use our own constant names.

Otherwise, the results could be very confusing, especially if there are
exceptions to this exception and we need the original system call number
after all.

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
