Return-Path: <SRS0=XK7L=AT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF15C433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2020 19:32:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF764206E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2020 19:32:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sTp4ZVm4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DVvtLLsq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cZgFkB06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF764206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c3r+DjynIF2+CesxOB6WSMlPoacTXP5LvkxGhnnr4Rk=; b=sTp4ZVm4JMdgSjj8AH/EHuq7r
	InFQJaMJnDy8s52INwwXtBwTciSxLVEgf2O59+O9ctL80iUzoo58lTMb7ve3IJsc7pv96mC1zwoB6
	ciob4oZlPNqLSwlvpQZ6FXaYBF7HKoVTdrTef9geGXadnc5DbXhcDj6ofKqgZQAWKu3yoX4CrtKQX
	ptnRi180NSbJdrWZhtsPHss2AUAvVtGD1vdJTi/TARVNn83PO+9DZU2aAwEh+nVffO4NeZd/1299u
	EpHk0jxhx1svt7+k7D9itobxD3wn40B0elKFYztpnJGtGVDskHZLJeQsQ4e/vqfRbVA3gcW3nbIoY
	xVBXEU9VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtFny-0000WE-EE; Wed, 08 Jul 2020 19:32:30 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtFnw-0000V1-B7
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jul 2020 19:32:29 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 02F0E40B01;
 Wed,  8 Jul 2020 19:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594236746; bh=9bClQpJRmWgkmlAVIoxADw7AHAp/FPU2r51L/0ye5W8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=DVvtLLsqXmGA4p5Jl/wPdOplRegbbzCYVUKjiXaLG5y9AufsLV/QPrIcz6JX11dz4
 7FNbJDdWaJVUUTjVsSQxI/V/ojs56o4sB3ExO+2NzgfOs9WJPZ8F1FF6b4nF2ZzTEd
 Pz8L+ZPB7+mVtmw793NRoZXWoN+CUHKLYpvuQ1Vov/Ur1G6eY9BLYrBzFn0qLkyjne
 QwUkZNcDpjUvSLaig1e6HX739SG3Qucly8Ns6zB1YUYmoAqnfbV3fitf6/7lVOz9c2
 n3fT5znHvMpsFN+bWU7Pg29zHqcBR544SzdoR/6rfB+XExjfbhQtkc/INq189/WNUB
 mKi6lqelS/63Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 21D06A008D;
 Wed,  8 Jul 2020 19:32:23 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8EDC4400CB;
 Wed,  8 Jul 2020 19:32:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="cZgFkB06";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bv6fasF3VqVYkWK5FgYApKyB8HBASJCFgPCoSpjXp6wA+bo1C3RnkwNcbupM3HjlBmc/X/vlE4FtcOSId40YNaHGSx0Kb0fvYK/jxS/IlyqXZrTYaSllXnlpF7D5PaAhqsv4zA3aiOF3bmJQOwVDBa28uaH+oUrb9o0sNeIQDTOtk2CLO8UhT6LGGWRKtBFrH0ekHHiKgva+EaS192ri6E/Qy8yUziz1unWu6JhkLcpeFNWRS7HjZMjgmj1mO7NuGUPpqkz4jZtUF8Lu9WSphsMCsfMCXE0iOMenQiZ5YQvTYigYmyytBzUbPD9tnUUFgt/Wp6tIZ7P+aEY9gsYGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bClQpJRmWgkmlAVIoxADw7AHAp/FPU2r51L/0ye5W8=;
 b=N/cdaxgl6LAwd5bhHeU7u5X7ynwNRuSUhI9iMQZ8Au/d25zpFzr7H27vPIpkm8FqlRVqtqd3C+/WVCcmxjYwEl372u+BryQ9gf17K9T9GY5JXE74ZE1JzLEnHh4pPHoJbY7cDhlPW7XdEK4fh2bFmml2zMFqNVTE1kFqR7xnzPs8Gu2MHuzLtVQ0sX5VWBeQ9YmQWMTOGp3bkDowdpnO8+5YssYcpYJOPEW5rhS2GZLx/xxRzSMV13R72VCqphfj86TfoMynJLHLiFfH9iR3MWoq7pbOVWbttD3XFmuuYbfVDZ9yFH75kgp0I0UdyOFGE+7VmnsfCEZdRfo91V2Gow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bClQpJRmWgkmlAVIoxADw7AHAp/FPU2r51L/0ye5W8=;
 b=cZgFkB06H/Db9XHl6ciAKXluzHtRuVURh0xozOnryR9x/BRtALe8sD9OHIbA9Y3yRTzKPbaqIUBK/twWkIosC2yyOi9CHl/9r30raCokdZ0Tb8FU9B9meNiH8uWis2qew+T+EbTU7+UF8EbTUCr04Er8z7JUw9/wiHWRNFb7cMg=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3093.namprd12.prod.outlook.com (2603:10b6:a03:dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.29; Wed, 8 Jul
 2020 19:32:20 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 19:32:20 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7.2 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v7.2 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWVKDp5vld8QE1SUOqPd+g+I3Dfw==
Date: Wed, 8 Jul 2020 19:32:20 +0000
Message-ID: <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
In-Reply-To: <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5752b63f-1fde-4f32-fda6-08d82375a1c7
x-ms-traffictypediagnostic: BYAPR12MB3093:
x-microsoft-antispam-prvs: <BYAPR12MB3093E58C89BD34FE8D8FAD6EB6670@BYAPR12MB3093.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gXzBiDGQ98eo/IffJXGM9MS2I6FnrGrnn8Ohyi8X35wrjyncm/ttUiD3WLSXZTZuNEJGimyPcu3f6HhMpZ1rMAH6AGXW9ZkWdNGVvz/KAjxjO4qPKz1kSxwf5VZwk6wil26X2Wp36TRPzhKhTYP/RP7RAA0sOCmRNewOsYdLJMQOWz/SaIFeJo35+nctZb3LSi2bk0N/hnbumku/Htyti7eQJ6jYjfXlGD2Q359Z8HeUZ/c3mOk02qojKi88ykyVF0zQYt34dbdcnvidyRlXZpr8o339KWWLEik1PrEJNfHnywKsxl3+lQQUYitSQr/f+q1UKj7c7qjibpaVZLW+2cXCYOax8fG4orhTqtCl+Crf4oSi7Q48wm1zAcJpbsJ3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(136003)(39860400002)(396003)(376002)(366004)(86362001)(31686004)(6512007)(31696002)(71200400001)(6486002)(26005)(8676002)(110136005)(4326008)(186003)(316002)(83380400001)(8936002)(478600001)(2616005)(53546011)(36756003)(76116006)(5660300002)(6506007)(66946007)(4744005)(66446008)(2906002)(66556008)(66476007)(64756008)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 1oL86eGfdama88ytiOOzWB2GZY9YlQqPtimsWkBcm6A4rNwoHlo9slNYlmt15oNc65f6JVbpWDg1pkEW+HyhjOKK26UKt3O69Q5uzTEgWyC07mQU9AMZFatD3dO9xIiB+JVZla9Z8RbjhFnTZmKsWGj71KWHA66DngVxN7o71SIf84DMOtxnOCAe+9E0/xmbxAzguiI65NVexXzA9FZnKBSGPI5YHclYnG75aIve/oFbgdugDbgODHVMScKYeJ03Q3iKycVtZsmAMxMOu5FlTDWU4dUDgSLEQF9kxrMBJO2cakIMEbGk/u629glfS7dYvSOJVYNJtiN2O2vy6f1AFcXlNHWCrO7P97jceyVZGtCWlBPC6/JC+5IyaZ2bTKbKOENQRoF6PDshDV5majdoluNW2VTSy05F6ozePfNPQ/CjietDBqOONt8tuIf7cGT1dXn2kyxL3SLC2xmamRueBqicJZSVuFzEfq1u0WBH3ks=
x-ms-exchange-transport-forked: True
Content-ID: <F24E066A5F09674D99A1DA85CAAB15E0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5752b63f-1fde-4f32-fda6-08d82375a1c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 19:32:20.3570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wgCif4Xp9ipo8qhY63mS1C3xw3KW6V58gbLo3GCQ3uTI/dtSqdIUqIXjU9Tm7wL6igEL4v4fNr2RRXV2ADxBkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_153228_808599_DE88ED2B 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/8/20 9:31 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> On 07/07/2020 17:55, Vineet Gupta via Libc-alpha wrote:
>> ---
>>    Changes since v7.1:
>>      - Added a few more 32-bit time_t syscalls to fixup-asm-unistd.h
>>        and regen arch-syscall.h to remove them: __NR_timer{g,s}ettime,
>>        __NR_clock_{gettime,nanosleep,settime}
>>      - minimal/annotated list of 32-bit syscall aliases in ARC sysdeps.h
>>        for 64-bit time_t support
>>      - Open-coded SYS_ify() but retained the macro as used by common
>>        code
>>      - No functional changes in generated dsos.
>>    Changes since v7:
>>      - used long int (iso int) in sysdep.h/syscall_error for handling registers
> LGTM, thanks.
> 
> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>

Thx a lot. I now have Reviewed-by tags on all ARC patches so we just need the
sysvipc/semctl y2038 patches to hit upstream before I can commit.

Thx,
-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
