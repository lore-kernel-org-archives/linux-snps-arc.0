Return-Path: <SRS0=Ntev=CS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33479C43461
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 10:19:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B804B21D7A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 10:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WZ19eyqi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AcyXkOSC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B804B21D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qqBlZIZ9bjl/7Vx5eiTdJFVTn9lel6/wFm+A4wwcQNY=; b=WZ19eyqiJ4zsRBPh2uBg9fTYy
	8fQQHM6fH6Cgx9LXnnIOzSK7wj/hFhxSYHclnkrXNQvkMCInYtYBOkmjPkye0MMjTHub4oKWWGx02
	wtFo0zaptW4sQEQjc4KXGeGcXib9g/KpibhHfXg3cuLC1rAmM8GWUExL+xUhZPcH348dhydo4flVM
	rE263dkMluQr0Qo4I/YeHJli0VXIGB6CcBd1kNTebv688DWaWEJivqCfqZgL8sqqJ0V834cCZEHdH
	jTPYakO2Gq8Km3MrIAMzsgpgR8T69IO4gs4UaGclJfknMu369BSlmE7/B2oRJadvVow6FCiqgFQxA
	AZTxdAeJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFxC8-0006lP-CS; Wed, 09 Sep 2020 10:19:16 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFxC6-0006ks-2i
 for linux-snps-arc@lists.infradead.org; Wed, 09 Sep 2020 10:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599646753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wxOxLDtiqIK0JP/pqmW7fzgflOjd6ogWcA5vwWbvIgo=;
 b=AcyXkOSCPEsaVVh1IDxiL8r6Rz8IXxZCbmKSZDa1FgdwcV/3b1OVjQtYnqXi9o9nSfiofK
 YFBAz8QueHoSWiPpslENzgBk3kAP6/i58ivLEnXUPIAWCxuEs0xzYL5aifIoOpXvyd1jEn
 coV72oeEUaOH9XsF2fP2F3XTnvAhR5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-NIoJTHUxPFqFIusWiug-nw-1; Wed, 09 Sep 2020 06:19:11 -0400
X-MC-Unique: NIoJTHUxPFqFIusWiug-nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02ECA1007467;
 Wed,  9 Sep 2020 10:19:10 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-112-83.ams2.redhat.com
 [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1149A7E8DA;
 Wed,  9 Sep 2020 10:19:08 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: [PATCH] support: user more portable atomic wrappers
References: <20200909033221.3549140-1-vgupta@synopsys.com>
Date: Wed, 09 Sep 2020 12:19:07 +0200
In-Reply-To: <20200909033221.3549140-1-vgupta@synopsys.com> (Vineet Gupta via
 Libc-alpha's message of "Tue, 8 Sep 2020 20:32:21 -0700")
Message-ID: <87v9gnb6ck.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_061914_160187_7FCD07EC 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta via Libc-alpha:

> This came up in a nascent arc64 port, lacking gcc atomics for now

Can you please change the GCC port to provide atomics instead?

It does not make sense to maintain those atomics in many projects
separately.

Thanks,
Florian
-- 
Red Hat GmbH, https://de.redhat.com/ , Registered seat: Grasbrunn,
Commercial register: Amtsgericht Muenchen, HRB 153243,
Managing Directors: Charles Cachera, Brian Klemm, Laurie Krebs, Michael O'Neill


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
