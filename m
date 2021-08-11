Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672EFC432BE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 18:54:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E392601FD
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 18:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E392601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnoc2vcoshaA3r9v4fA7Sbs6n3HP+ngCcskWn36AbOo=; b=ZZ1T+hdbW4/915OWR/RQsmin3r
	YSG0W//3xY/LSWRSSYfGVZLqB7m7QqLFVger9Wx4fYfISTE/7e0riqxEMHnrRIjBXLfJbuqOGmdgk
	8th5vC42AAeqsr+Ela+lrM6XI5yih533G69QApbW7/mWxvyB3UHy0obklX4gyT+9VrnWekOKm/8pX
	7vY3EZAMGxm/LwiJtnnusk5mgsZI1bnoLOtjtEdfe+MQZZLrF28pz9cx/Lr5h0thAGbZ7msMXSQYk
	X8lwZu05q+FQr1FJ4a0VPDxcZO1n+RkjXeifJq7ujW8AyeWsMyBQE/FStJ055hzkkFOzj9qAGKb51
	p3b1dZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDtNS-007vlt-Fm; Wed, 11 Aug 2021 18:54:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDtNP-007vl7-B0
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 18:54:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87E116105A;
 Wed, 11 Aug 2021 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628708094;
 bh=cL9/V/8y48DqMm0G8VqpaHkYQP93I7XMoZKL5XYZJIk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=t7eYs+MheagFnbayhOJoScPhNm1JfqpHSZhBq0rOce+BYN3DpclmvWRjLXW1gjnsB
 wy/knE/P6Tq5TqyYwPY6t4RqxTC461yti36XG2pGxYTDJHCxsWP3W0UYAmT5ix3Sdc
 Asx9+TGU0136x8yA2JtxxbscjtFc9HhJhcTHhHcTt+Z0O+x9bYchIg6nH3on+d/v71
 6j9GhRQetE+7v/YkkK50CBy+owff2OIYvBL+kp0b+MavFyStIi4nrp6NgKofkY0LhG
 /iyPSig9l4hANt3ZVxakxl4SIVGujK9Q2zI2+/xj+iEgALrelP2Z6f/U7QEoc1fxHb
 OtRD8htJnPZuA==
Subject: Re: [PATCH 04/18] ARC: mm: remove pgd_offset_fast
To: Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-5-vgupta@kernel.org> <YRNcJpyr76h5EK0k@kernel.org>
X-Priority: 1 (Highest)
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <c8170afd-2a9d-a8fd-3f4d-bbde4ff02e36@kernel.org>
Date: Wed, 11 Aug 2021 11:54:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRNcJpyr76h5EK0k@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_115455_443440_B8ABBA5D 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 8/10/21 10:12 PM, Mike Rapoport wrote:
> On Tue, Aug 10, 2021 at 05:42:44PM -0700, Vineet Gupta wrote:
>> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
>> ---
>>   arch/arc/include/asm/pgtable.h | 23 -----------------------
>>   arch/arc/mm/fault.c            |  2 +-
>>   2 files changed, 1 insertion(+), 24 deletions(-)
> Shouldn't this be a part of the patch that removed usage of the scratch reg
> for pgd?

Yep, now folded in there. Also updated prev patch's terse commit log.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
