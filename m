Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEC3C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Mar 2022 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WaDCCmEQYuZjP8/BVMLe5iWl4BAR+8BV8EMMxRIz00=; b=UOkM5tKt8+Xd/a
	Y8FJyqQDRsZ4LRTMSYPvHw8dpZUGw3lDl1Qhzkf+mztpIm7Q20znO9T/5rqNzuIdlYzdb7oG0H4fX
	h6PnHe4BvuYBKxLMu9mQHUrLvNhNi4zfmeoY3O9mSb/FTvLkm33ULeKeuzSFufx7nYS+zW9m2BrKg
	XYzOmfslmwyxdBLmQKMB+kkdGmrkdEeIyf47LwRAUIQDcmZCUqoXioN1JkqTRbnOAZPs0BqGapOiJ
	NsK4RSBEiJeGbekpTE3S5lbsWO0iWkG0cNJ8+Umh+iA507xJtY/Tbz3id4Jst0I15Jm6lKmSlEK0O
	plkef6P4nevvg848mEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPr1y-007ZNd-QG; Thu, 03 Mar 2022 19:22:30 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPr1w-007ZNH-7j
 for linux-snps-arc@lists.infradead.org; Thu, 03 Mar 2022 19:22:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id y24so8066523ljh.11
 for <linux-snps-arc@lists.infradead.org>; Thu, 03 Mar 2022 11:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mbirRpsLH2dd6eubiR19+cyOsqQYfCYHYhENHGb0WMc=;
 b=MJsPBnM1F/HkPBSaO+AoUzMRDthpl91bOMq081YqJP8Io1C8lhP60NxzaI3SeZOdYi
 LZbET+og+fPN6ONo79v+w4aRgARMWIy5J0v1dp3IbjO6nppuLiN04Wye5IsGWWtonZ7O
 LLnsZ+o7kjfL7+Twv6OwjgD96RaJFBq3S3CL4UB5cbZsnSO/gNNsaRs8njZLjC1/fKtx
 p276eEj+1827VaVd2VU5rR5YnZjza3ippNyYlNNve6j8p/oT8ah3ZXxUEPZgU3wpo/Ls
 TNLlE1mGQxYje02F2v3sNSwfZ7Q7bApdP5cUIaNXKipEjmqonqvAq+E9JOeTD/U0XJ1I
 ZRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mbirRpsLH2dd6eubiR19+cyOsqQYfCYHYhENHGb0WMc=;
 b=h66bIntR35jQE7hBfjxQSp2/nwy4aCW/+YRuY7fiz8PsByySZ5OWzpCW0BE0/Mupcw
 W9+Np7Do+8m0eXAR6CjAxWXF9KMHqiIj9TknSL5xPG2yJ4E+m+SLzDkgO9JbqoXW5sXY
 jxwscRrrWGCedXchD1yeB5bDMp+ZMUNTxUyPGZiC2695fnQWxILom4VlwZ/sJzHlVoiT
 lCjhnU2C6kqaoT1iw9pIUl9/TZX7qj1fBZn2iqLRiCpOAuSNzTnQFhvwTbUbsvp6HaZc
 F7357Pzblzsw2yWUY5fxWQxF5+e0jT4sOVsd190MJQf0DQ79ufzz2O1VzH8VdRiKJcEq
 u+Wg==
X-Gm-Message-State: AOAM532X6J+88C/6dOk/C0pP0ziTfGT35ntxgxUMEy8pOg9ds0aQysAw
 tukWV8RfP/kLzSzJxoZKrnU=
X-Google-Smtp-Source: ABdhPJzo7Qs9/l15lrJIzHJcBD95btCu932PJdFQBSmtybrC4k2kXAGkW/vSvvqwS7VgBwhXfzO97w==
X-Received: by 2002:a2e:2e0d:0:b0:246:3765:87a8 with SMTP id
 u13-20020a2e2e0d000000b00246376587a8mr24967620lju.289.1646335345663; 
 Thu, 03 Mar 2022 11:22:25 -0800 (PST)
Received: from curiosity ([80.211.22.60]) by smtp.gmail.com with ESMTPSA id
 f8-20020a056512092800b00445ba1264cbsm584307lft.89.2022.03.03.11.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:22:25 -0800 (PST)
Date: Thu, 3 Mar 2022 22:22:22 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: Re: [RFC PATCH 00/13] ARC: handle the lack of ZOL support
Message-ID: <YiEVbmQ725DP91Yg@curiosity>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
 <f043c242-ee1c-a671-dd6f-b8381691d2ce@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f043c242-ee1c-a671-dd6f-b8381691d2ce@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_112228_301745_60D19581 
X-CRM114-Status: UNSURE (   8.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Vineet,

> Thx for doing this. I think the series mixes a few things not related to ZOL
> removal - the changelog for removal of -Os specific code seems incorrect
> etc.
> Let me repost with slight more cleanups.

Great. I will help with testing of the updated version.

Regards,
Sergey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
