Return-Path: <SRS0=pJgN=B7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382B8C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 21 Aug 2020 06:51:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F391420748
	for <linux-snps-arc@archiver.kernel.org>; Fri, 21 Aug 2020 06:51:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NzDMf3Nh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=217software.com header.i=@217software.com header.b="vcmda7vI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F391420748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=217software.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:To:From:Subject:Date:Message-ID:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ir1sRfRzIor/0e7gSm1CN9mm+Fkf2oI6gUqgR/nqf8=; b=NzDMf3NhqkJRFclO7lKaVqLUE1
	t4wliCfgRvVLqdFFkux1qm6f7ponmzT90brChwkFNVYCunHU9cT1KgmPsmvzqieIdbGJeqJ1OrNkf
	MuL0V7yvvQVTlJo8ZjUCuCxAVTPE8Cz9XjCbwnpZ164ljYqwBDZXJfeb9qgOPtqU/P7/SVNnPm/TI
	zeQuHiF2I5a8x3W6nDV13VXNKLslS4L7+BhtRff5H1XNsyJ36vl56lTRvQErV3wKJeBOD5y3b4zTF
	L/ScE4fwCX1R/T4nM/JDCR7W2J3GEsUCjzUa01WQPB6bY00704iSceQPXbY8aggaxGFPhJhiqq+Kc
	IjhFNRqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k90to-0001VH-6d; Fri, 21 Aug 2020 06:51:40 +0000
Received: from [2a00:c1e0:0:2:0:1:31ab:a73d] (helo=e3.217software.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k90tm-0001Uy-GD
 for linux-snps-arc@lists.infradead.org; Fri, 21 Aug 2020 06:51:39 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 e3.217software.com 3D2F6215AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=217software.com;
 s=e3; t=1597992152; bh=tflty/fZCte5YnPPwNdkWj99y9AlWtWTnqe79Nb+Rdk=;
 h=Date:Subject:From:Reply-To:To:List-Unsubscribe:List-Id:From;
 b=vcmda7vIy+e7OzkSTUnCDfNXGCVua8XIyi+qSfkw+FYMeHpiSr3cYL3HFLjWdb4Hg
 l16fcNQRF0hOzI66TClRBj3yrSjeOaxhsvCbV2P7U3gj7V8kmAPT4IubUdf5E1MWOt
 J8tObdD5RmeFSpJqZYxe2rO4MQLxzVbyevhwLdzg=
Message-ID: <7b2647eaf3cd9216f2777837101529cc@217software.com>
Date: Fri, 21 Aug 2020 06:42:14 +0000
Subject: Fwd: Re: Would You please send me hosting compare link?
From: John <info@217software.com>
To: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
MIME-Version: 1.0
X-Sender: info@217software.com
X-Receiver: linux-snps-arc@lists.infradead.org
X-Fjla-Tracking-Did: 0
X-Fjla-Subscriber-Uid: ge409lp63a914
X-Fjla-Mailer: SwiftMailer - 5.4.x
X-Fjla-Delivery-Sid: 4
X-Fjla-Customer-Uid: gx0582et0060f
X-Fjla-Customer-Gid: 0
X-Fjla-Campaign-Uid: yb0822fonl9c3
Feedback-ID: yb0822fonl9c3:ge409lp63a914:cs4233gcj53de:gx0582et0060f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_025138_701402_A83E9E90 
X-CRM114-Status: UNSURE (   3.13  )
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
Reply-To: John <info@217software.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2020-08-12 13:22, John wrote:
> Thanks. I am going to mail it to my team.
> 
> On 2020-08-12 13:28, Kris wrote:
>> Hello John,
>>
>> Yes, there You go: p3u.cn/hostingcompare
>> 
>> On 2020-08-12 13:33, John wrote:
>>> Hello Kris,
>>> 
>>> we are going to start few new webpages projects so I am going to need web hosting, would You please write me that web hosting compare website, which You specified some time ago?
>>> 
>> 
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
