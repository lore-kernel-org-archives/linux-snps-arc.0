Return-Path: <SRS0=8BTh=LB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FAKE_REPLY_A1,MAILING_LIST_MULTI,SPF_HELO_NONE,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F60C47082
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 15:55:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142446101A
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 15:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142446101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=51iT+78+GZ1c7O4bgBJ52Gx38bMhrxK4+e9966j4Yzk=; b=e6ScVgxgtdenvr
	VBpPZxQf3cyfmQuiyV0mHMV7py4NGwY6Ql1d0yJ6rnhqa5BHcoA4LV/kFFDOvl5/QrJNPHbLy6Kpt
	0LwBNmcRtySRHmVi3kLsAh16rUZX9mTVt87C/9/dXsnZf7rGyZXrUOGax/bXKUbYUHouKrfXeEAN3
	k+BnDOfzuj5RiissIF4xUFZtN2180BLC1UhgkTNAmWv+jx+sfAWi+3qJWiEUXuJgrnI6fvuck9F6x
	YIoR7p+YfPXCwk+K9dXqx5rr9lv/XElShNMw8o4jT+oiYGe7NZ7eIodrA6g+sHdmMOcy4chABDR9Q
	cYr4d8mNPSlaBya7j0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqHb5-004LMf-Jp; Mon, 07 Jun 2021 15:55:27 +0000
Received: from einhorn-mail.in-berlin.de ([217.197.80.20]
 helo=einhorn-mail-out.in-berlin.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpUEk-00GUbk-Dh
 for linux-snps-arc@lists.infradead.org; Sat, 05 Jun 2021 11:13:08 +0000
X-Envelope-From: doko@debian.org
Received: from authenticated.user (localhost [127.0.0.1]) by
 einhorn.in-berlin.de with ESMTPSA id 155BCric011349
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 5 Jun 2021 13:12:53 +0200
To: 989453@bugs.debian.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Helmut Grohne <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>
From: Matthias Klose <doko@debian.org>
Subject: Re: Debian: gcc: add support for ARC
Message-ID: <746063d5-762a-79bd-529c-c8f92848d043@debian.org>
Date: Sat, 5 Jun 2021 13:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_041306_787187_62FDC08C 
X-CRM114-Status: UNSURE (   4.23  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 07 Jun 2021 08:55:26 -0700
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

Control: tags -1 + incomplete

These definitions have to go first to
https://wiki.debian.org/Multiarch/Tuples

Please update.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
